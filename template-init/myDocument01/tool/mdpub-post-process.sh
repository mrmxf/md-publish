# post-process shell script for this document
# all file paths are relative to the root folder of the project
#
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#
# rename the pandoc output to the right filename - from the config file
# note that $DOC_DATE is manually set and $MDPUB_DATE is reset every build
SRC="$OUTPUT_FOLDER/$DOC_SOURCE_NAME.$DOC_SOURCE_EXTN"
if [ -e "$SRC" ] ; then
  mv  "$SRC" "$OUTPUT_FOLDER/${DOC_OUTPUT_NAME}.$DOC_OUTPUT_EXTN"
fi