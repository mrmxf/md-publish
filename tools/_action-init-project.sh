  if [ -z $QUIET ] ; then
    echo -e "${Ctxt}    copy init files$Cinfo $SCRIPT_FOLDER/template-init/ $Coff"
  fi
  cp -r "$SCRIPT_FOLDER/template-init/" .

  exit 0
