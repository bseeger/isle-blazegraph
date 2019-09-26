# Default log4j configuration for ISLE Blazegraph.
# Please note: Some instructions are from original log4j.properties.
# ISLE edits will be commented. 
# See the individual classes for the
# specific loggers, but generally they are named for the class in
# which they are defined.

# Default log4j configuration for testing purposes.
#
# ISLE: Due to perfomance and info volume you'll want to set the default log level to ERROR or WARN
log4j.rootCategory={{getv "/blazegraph/root/category/log"}}, console
#log4j.rootCategory=WARN, dest2

# Loggers.
# Note: logging here at INFO or DEBUG will significantly impact throughput!
# ISLE: Due to perfomance and info volume you'll want to set the default log level to ERROR or WARN
log4j.logger.com.bigdata={{getv "/blazegraph/bigdata/log"}}
log4j.logger.com.bigdata.btree={{getv "/blazegraph/bigdata/btree/log"}}

# Normal data loader (single threaded).
#log4j.logger.com.bigdata.rdf.store.DataLoader=INFO

# dest1
log4j.appender.dest1=org.apache.log4j.ConsoleAppender
log4j.appender.dest1.layout=org.apache.log4j.PatternLayout
log4j.appender.dest1.layout.ConversionPattern=%-5p: %F:%L: %m%n
#log4j.appender.dest1.layout.ConversionPattern=%-5p: %r %l: %m%n
#log4j.appender.dest1.layout.ConversionPattern=%-5p: %m%n
#log4j.appender.dest1.layout.ConversionPattern=%-4r [%t] %-5p %c %x - %m%n
#log4j.appender.dest1.layout.ConversionPattern=%-4r(%d) [%t] %-5p %c(%l:%M) %x - %m%n

# dest2 includes the thread name and elapsed milliseconds.
# Note: %r is elapsed milliseconds.
# Note: %t is the thread name.
# See http://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/PatternLayout.html
log4j.appender.dest2=org.apache.log4j.ConsoleAppender
log4j.appender.dest2.layout=org.apache.log4j.PatternLayout
log4j.appender.dest2.layout.ConversionPattern=%-5p: %r %X{hostname} %X{serviceUUID} %X{taskname} %X{timestamp} %X{resources} %t %l: %m%n

##
# Rule execution log. This is a formatted log file (comma delimited).
# ISLE: Default log level is INFO
log4j.logger.com.bigdata.relation.rule.eval.RuleLog={{getv "/blazegraph/bigdata/rule/log"}},ruleLog
log4j.additivity.com.bigdata.relation.rule.eval.RuleLog=false
log4j.appender.ruleLog=org.apache.log4j.ConsoleAppender
# ISLE: Default log level is INFO
log4j.appender.ruleLog.Threshold={{getv "/blazegraph/bigdata/rule/log"}}
log4j.appender.ruleLog.Append=true
# I find that it is nicer to have this unbuffered since you can see what
# is going on and to make sure that I have complete rule evaluation logs
# on shutdown.
log4j.appender.ruleLog.BufferedIO=false
log4j.appender.ruleLog.layout=org.apache.log4j.PatternLayout
log4j.appender.ruleLog.layout.ConversionPattern=%m

## ISLE - all logs below are for debugging purposes only.
## Endusers should edit as needed and then bindmount this file for output.
## Please refer to Blazegraph documentation for the log levels and output.

##
# Summary query evaluation log (tab delimited file). Uncomment the next line to enable.
#log4j.logger.com.bigdata.bop.engine.QueryLog=INFO,queryLog
log4j.additivity.com.bigdata.bop.engine.QueryLog=false
log4j.appender.queryLog=org.apache.log4j.FileAppender
log4j.appender.queryLog.Threshold=ALL
log4j.appender.queryLog.File=/usr/local/tomcat/logs/queryLog.csv
log4j.appender.queryLog.Append=true
# I find that it is nicer to have this unbuffered since you can see what
# is going on and to make sure that I have complete rule evaluation logs
# on shutdown.
log4j.appender.queryLog.BufferedIO=false
log4j.appender.queryLog.layout=org.apache.log4j.PatternLayout
log4j.appender.queryLog.layout.ConversionPattern=%m

##
# BOp run state trace (tab delimited file).  Uncomment the next line to enable.
#log4j.logger.com.bigdata.bop.engine.RunState$TableLog=INFO,queryRunStateLog
log4j.additivity.com.bigdata.bop.engine.RunState$TableLog=false
log4j.appender.queryRunStateLog=org.apache.log4j.FileAppender
log4j.appender.queryRunStateLog.Threshold=ALL
log4j.appender.queryRunStateLog.File=/usr/local/tomcat/logs/queryRunState.log
log4j.appender.queryRunStateLog.Append=true
# I find that it is nicer to have this unbuffered since you can see what
# is going on and to make sure that I have complete rule evaluation logs
# on shutdown.
log4j.appender.queryRunStateLog.BufferedIO=false
log4j.appender.queryRunStateLog.layout=org.apache.log4j.PatternLayout
log4j.appender.queryRunStateLog.layout.ConversionPattern=%m

##
# Solutions trace (tab delimited file).  Uncomment the next line to enable.
#log4j.logger.com.bigdata.bop.engine.SolutionsLog=INFO,solutionsLog
log4j.additivity.com.bigdata.bop.engine.SolutionsLog=false
log4j.appender.solutionsLog=org.apache.log4j.ConsoleAppender
#log4j.appender.solutionsLog=org.apache.log4j.FileAppender
log4j.appender.solutionsLog.Threshold=ALL
log4j.appender.solutionsLog.File=/usr/local/tomcat/logs/solutions.csv
log4j.appender.solutionsLog.Append=true
# I find that it is nicer to have this unbuffered since you can see what
# is going on and to make sure that I have complete rule evaluation logs
# on shutdown.
log4j.appender.solutionsLog.BufferedIO=false
log4j.appender.solutionsLog.layout=org.apache.log4j.PatternLayout
log4j.appender.solutionsLog.layout.ConversionPattern=SOLUTION:\t%m

##
# SPARQL query trace (plain text file).  Uncomment 2nd line to enable.
log4j.logger.com.bigdata.rdf.sparql.ast.eval.ASTEvalHelper=WARN
#log4j.logger.com.bigdata.rdf.sparql.ast.eval.ASTEvalHelper=INFO,sparqlLog
log4j.additivity.com.bigdata.rdf.sparql.ast.eval.ASTEvalHelper=false
log4j.appender.sparqlLog=org.apache.log4j.ConsoleAppender
#log4j.appender.sparqlLog=org.apache.log4j.FileAppender
log4j.appender.sparqlLog.Threshold=ALL
log4j.appender.sparqlLog.File=/usr/local/tomcat/logs/sparql.txt
log4j.appender.sparqlLog.Append=true
# I find that it is nicer to have this unbuffered since you can see what
# is going on and to make sure that I have complete rule evaluation logs
# on shutdown.
log4j.appender.sparqlLog.BufferedIO=false
log4j.appender.sparqlLog.layout=org.apache.log4j.PatternLayout
log4j.appender.sparqlLog.layout.ConversionPattern=#----------%d-----------tx=%X{tx}\n%m\n