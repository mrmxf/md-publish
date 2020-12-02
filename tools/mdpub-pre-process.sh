# PRE-process shell script for this document
# all file paths are relative to the root folder of the project
#
# EKO is the prefix for success messages to the console
# ERO is the prefix for error   messages to the console
#
SCRIPTPATH="$( cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 ; pwd -P )"
#
echo -e "$EKO this script is running from $Cfile $SCRIPTPATH"
echo -e "$ERO this is a sample error message"
