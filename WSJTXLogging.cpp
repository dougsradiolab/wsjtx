#include "WSJTXLogging.hpp"

#include <string>
#include <exception>
#include <sstream>

#include <boost/log/core.hpp>
#include <boost/log/utility/exception_handler.hpp>
#include <boost/log/trivial.hpp>
#include <boost/log/sinks/text_file_backend.hpp>
#include <boost/log/sinks/async_frontend.hpp>
#include <boost/log/sinks/debug_output_backend.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/expressions/formatters/date_time.hpp>
#include <boost/log/expressions/predicates/channel_severity_filter.hpp>
#include <boost/log/support/date_time.hpp>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <boost/container/flat_map.hpp>

#include <QDir>
#include <QFile>
#include <QTextStream>
#include <QString>
#include <QStandardPaths>
#include <QRegularExpression>
#include <QMessageLogContext>

#include "Logger.hpp"
#include "qt_helpers.hpp"

namespace logging = boost::log;
namespace trivial = logging::trivial;
namespace keywords = logging::keywords;
namespace expr = logging::expressions;
namespace sinks = logging::sinks;
namespace ptime = boost::posix_time;
namespace container = boost::container;

BOOST_LOG_ATTRIBUTE_KEYWORD(severity, "Severity", trivial::severity_level)
BOOST_LOG_ATTRIBUTE_KEYWORD(channel, "Channel", std::string)

namespace
{
  // Top level exception handler that gets exceptions from filters and
  // formatters.
  struct exception_handler
  {
    typedef void result;

    void operator () (std::runtime_error const& e) const
    {
      std::cout << "std::runtime_error: " << e.what () << std::endl;
    }
    void operator () (std::logic_error const& e) const
    {
      std::cout << "std::logic_error: " << e.what () << std::endl;
      //throw;
    }
  };
}

WSJTXLogging::WSJTXLogging ()
{
  // Catch relevant exceptions from logging.
  logging::core::get ()->set_exception_handler
    (
     logging::make_exception_handler<std::runtime_error, std::logic_error> (exception_handler {})
     );
 
  // Check for a user-defined logging configuration settings file.
  QFile log_config {QStandardPaths::locate (QStandardPaths::ConfigLocation, "wsjtx_log_config.ini")};
  if (log_config.exists () && log_config.open (QFile::ReadOnly) && log_config.isReadable ())
    {
      QTextStream ts {&log_config};
      auto config = ts.readAll ();

      // Substitution variables.
      container::flat_map<QString, QString> replacements =
        {
         {"DesktopLocation", QStandardPaths::writableLocation (QStandardPaths::DesktopLocation)},
         {"DocumentsLocation", QStandardPaths::writableLocation (QStandardPaths::DocumentsLocation)},
         {"TempLocation", QStandardPaths::writableLocation (QStandardPaths::TempLocation)},
         {"HomeLocation", QStandardPaths::writableLocation (QStandardPaths::HomeLocation)},
         {"CacheLocation", QStandardPaths::writableLocation (QStandardPaths::CacheLocation)},
         {"GenericCacheLocation", QStandardPaths::writableLocation (QStandardPaths::GenericCacheLocation)},
         {"GenericDataLocation", QStandardPaths::writableLocation (QStandardPaths::GenericDataLocation)},
         {"AppDataLocation", QStandardPaths::writableLocation (QStandardPaths::AppDataLocation)},
         {"AppLocalDataLocation", QStandardPaths::writableLocation (QStandardPaths::AppLocalDataLocation)},
        };
      // Parse the configration settings substituting the variable if found.
      QString new_config;
      int pos {0};
      QRegularExpression subst_vars {R"(\${([^}]+)})"};
      auto iter = subst_vars.globalMatch (config);
      while (iter.hasNext ())
        {
          auto match = iter.next ();
          auto const& name = match.captured (1);
          auto repl_iter = replacements.find (name);
          auto repl = repl_iter != replacements.end () ? repl_iter->second : "${" + name + "}";
          new_config += config.mid (pos, match.capturedStart (1) - 2 - pos) + repl;
          pos = match.capturedEnd (0);
        }
      new_config += config.mid (pos);
      std::stringbuf buffer {new_config.toStdString (), std::ios_base::in};
      std::istream stream {&buffer};
      Logger::init_from_config (stream);
      LOG_INFO ("Unable to read logging configuration file: " << log_config.fileName ());
    }
  else                          // Default setup
    {
      //
      // Define sinks, filters, and formatters using expression
      // templates for efficiency.
      //

      // Default log file location.
      QDir app_data {QStandardPaths::writableLocation (QStandardPaths::AppLocalDataLocation)};
      Logger::init ();          // Basic setup of attributes
      auto core = logging::core::get ();

      //
      // Sink intended for general use that passes everything above
      // selected severity levels per channel. Log file is appended
      // between sessions and rotated to limit storage space usage.
      //
      auto sys_sink = boost::make_shared<sinks::asynchronous_sink<sinks::text_file_backend>>
        (
         keywords::auto_flush = false
         , keywords::file_name = app_data.absoluteFilePath ("wsjtx_syslog.log").toStdString ()
         , keywords::target_file_name = app_data.absoluteFilePath ("old_logs/wsjtx_syslog_%Y-%m-%d_%H-%M-%S.%N.log").toStdString ()
         , keywords::rotation_size = 5 * 1024 * 1024
         , keywords::time_based_rotation = sinks::file::rotation_at_time_point (0, 0, 0)
         , keywords::open_mode = std::ios_base::out | std::ios_base::app
         , keywords::enable_final_rotation = false
         );

      sys_sink->locked_backend ()->set_file_collector
        (
         sinks::file::make_collector
         (
          keywords::target = app_data.absoluteFilePath ("old_logs").toStdString ()
          , keywords::max_size = 40 * 1024 * 1024
          , keywords::min_free_space = 1024 * 1024 * 1024
          , keywords::max_files = 10
          )
         );
      sys_sink->locked_backend ()->scan_for_files ();

      // Per channel severity level filter
      using min_severity_filter = expr::channel_severity_filter_actor<std::string, trivial::severity_level>;
      min_severity_filter min_severity = expr::channel_severity_filter (channel, severity);
      min_severity["SYSLOG"] = trivial::info;
      min_severity["RIGCTRL"] = trivial::info;
      min_severity["DATALOG"] = trivial::info;
      sys_sink->set_filter (min_severity || severity >= trivial::fatal);

      sys_sink->set_formatter
        (
         expr::stream
         << "[" << channel
         << "][" << expr::format_date_time<ptime::ptime> ("TimeStamp", "%Y-%m-%d %H:%M:%S.%f")
         << "][" << expr::format_date_time<ptime::time_duration> ("Uptime", "%O:%M:%S.%f")
         << "][" << trivial::severity
         << "] " << expr::message
         );

      core->add_sink (sys_sink);

#if !defined (NDEBUG) && defined (Q_OS_WIN)
      // auto windbg_sink = boost::make_shared<sinks::synchronous_sink<sinks::debug_output_backend>> ();
      // windbg_sink->set_filter (trivial::severity >= trivial::trace && expr::is_debugger_present ());
      // core->add_sink (windbg_sink);
#endif
    }
  // Indicate start of logging
  LOG_INFO ("Log Start");
}

WSJTXLogging::~WSJTXLogging ()
{
  LOG_INFO ("Log Finish");
  auto lg = logging::core::get ();
  lg->flush ();
  lg->remove_all_sinks ();
}

// Reroute Qt messages to the system logger
void WSJTXLogging::qt_log_handler (QtMsgType type, QMessageLogContext const& context, QString const& msg)
{
  // Convert Qt message types to logger severities
  auto severity = trivial::trace;
  switch (type)
    {
    case QtDebugMsg: severity = trivial::debug; break;
    case QtInfoMsg: severity = trivial::info; break;
    case QtWarningMsg: severity = trivial::warning; break;
    case QtCriticalMsg: severity = trivial::error; break;
    case QtFatalMsg: severity = trivial::fatal; break;
    }
  // Map non-default Qt categories to logger channels, Qt logger
  // context is mapped to the appropriate logger attributes.
  auto log = sys::get ();
  std::string file;
  std::string function;
  if (context.file)
    {
      file = context.file;
    }
  if (context.function)
    {
      function = context.function;
    }
  if (!context.category || !qstrcmp (context.category, "default"))
    {
      BOOST_LOG_SEV (log, severity)
        << boost::log::add_value ("Line", context.line)
        << boost::log::add_value ("File", context.file)
        << boost::log::add_value ("Function", context.function)
        << msg.toStdString ();
    }
  else
    {
      BOOST_LOG_CHANNEL_SEV (log, std::string {context.category}, severity)
        << boost::log::add_value ("Line", context.line)
        << boost::log::add_value ("File", context.file)
        << boost::log::add_value ("Function", context.function)
        << msg.toStdString ();
    }
  if (QtFatalMsg == type)
    {
      // bail out
      //throw std::runtime_error {"Fatal Qt Error"};
    }
}
