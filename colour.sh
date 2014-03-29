#
# @made by Pawel v1.0
# potentially works with any input related to java processes
# simply pipe the output of 'ps -ef | grep java' into this script, it will highlight groups of settings and arguments for java processes

SCRIPT_WHITE="\\\\033\[37m"
SCRIPT_RED="\\\\033\[31m"
SCRIPT_GREEN="\\\\033\[32m"
SCRIPT_YELLOW="\\\\033\[33m"
SCRIPT_BLUE="\\\\033\[34m"
SCRIPT_MAGENTA="\\\\033\[35m"
SCRIPT_CYAN="\\\\033\[36m"

WHITE="\033[37m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"

echo 'Pimping the output...'

while read line; do
    pattern='(-DAPP_NAME=(.*?)\s)'
    jvmvariables='(-D(.*?)\s)'
    gcvariables='(-X(.*?)\s)'
    classpathvariables='(-c(lass)?p(ath)?.(.*?)\s)'
    profiles='(-Dspring\.profiles\.active=(.*?)\s)'
	ports='(.(([\w\.])+)port=([0-9]+))'
    
    colored_line=$( perl -pe 's|'"$jvmvariables"'|'"$SCRIPT_CYAN"'\1'"$SCRIPT_WHITE"'|g' )
    colored_line=$( echo "$colored_line" | perl -pe 's|'"$gcvariables"'|'"$SCRIPT_GREEN"'\1'"$SCRIPT_WHITE"'|g' )
    colored_line=$( echo "$colored_line" | perl -pe 's|'"$classpathvariables"'|'"$SCRIPT_YELLOW"'\1'"$SCRIPT_WHITE"'|g' )
	colored_line=$( echo "$colored_line" | perl -pe 's|'"$ports"'|'"$SCRIPT_RED"'\1'"$SCRIPT_WHITE"'|gi' )
    colored_line=$( echo "$colored_line" | perl -pe 's|'"$profiles"'|'"$SCRIPT_WHITE"'\1'"$SCRIPT_WHITE"'|' )
    colored_line=$( echo "$colored_line" | perl -pe 's|'"$pattern"'|'"$SCRIPT_WHITE"'\1'"$SCRIPT_WHITE"'|' )
    echo -e "$colored_line"
done

echo "Legend:"
echo -e "$CYAN**$WHITE - java variables"
echo -e "$YELLOW**$WHITE - java classpath"
echo -e "$GREEN**$WHITE - jvm variables"
echo -e "$RED**$WHITE - application ports"
echo -e "$WHITE**$WHITE - spring profiles used and application name"
