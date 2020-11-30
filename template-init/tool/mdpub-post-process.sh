# post-process shell script for this document
# all file paths are relative to the root folder of the project
#
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#
# rename the pandoc output to the right filename - from the config file
SRC="$OUTPUT_FOLDER/pandoc-ag04-output.docx"
if [ -e "$SRC" ] ; then
  mv  "$SRC" "$OUTPUT_FOLDER/${DOC_PREFIX}-${DOC_TITLE}-${DOC_DATE}(${DOC_COMMENT}).docx"
fi