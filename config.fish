## java 11 jdk

set --export JAVA_HOME (dirname (dirname (readlink -f (which java))))
set -gx PATH $JAVA_HOME $PATH
