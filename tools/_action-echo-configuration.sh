# echo the running configuration
if [ -z $QUIET ] ; then
  echo -e "${Cinfo}          action= $Ccmd$ACTION $1 $2 $3 $4 $5$Coff"
  echo -e "${Cinfo}          --quiet= $Cinfo$QUIET$Coff"
  echo -e "${Ctxt}                >>>$Cheading $MDPUB_TITLE $Coff"
  echo -e "${Ctxt}default CONFIG from$Cfile $SCRIPT_FOLDER/$CONFIG_FILENAME $Coff"
  echo -e "${Ctxt}project CONFIG from$Cfile $CONFIG_PROJECT $Coff"
  echo -e "${Ctxt}     script version$Cinfo $MDPUB_SCRIPT_VERSION $Coff"
  echo -e "${Ctxt}      output folder$Cinfo $OUTPUT_FOLDER $Coff"
  echo -e "${Ctxt}      default files$Cinfo $FILE_GLOB $Coff"
fi