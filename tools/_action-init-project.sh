## mdpub init project script
## (C) MrMXF 2020
##
## issues https://github.com/mrmxf/md-publish/issues
##
##
SRC="$SCRIPT_FOLDER/template-init/**"

if [ -z $QUIET ] ; then
  echo -e "${Ctxt}    copy init files$Cinfo $SCRIPT_FOLDER/template-init/ $Coff"
fi
cp -r "$SRC" .

exit 0
