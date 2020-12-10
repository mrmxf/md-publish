# post-process shell script for this document
# all file paths are relative to the root folder of the project
#
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#
# rename the pandoc output to the right filename - from the config file
# note that $DOC_DATE is manually set and $MDPUB_DATE is reset every build
SRC="$OUTPUT_FOLDER/$DOC_SOURCE_NAME.$DOC_SOURCE_EXT"
if [ -e "$SRC" ] ; then
  mv  "$SRC" "$OUTPUT_FOLDER/${DOC_PREFIX}-${DOC_TITLE}-${MDPUB_DATE}(${DOC_COMMENT}).$DOC_SOURCE_EXT"
fi