## mdpub help script
## (C) MrMXF 2020
##
## issues https://github.com/mrmxf/md-publish/issues
##
##
# echo help
echo -e "${Ctxt}Usage:$Coff"
echo -e "${Ccmd}  ${cmd}$SCRIPT_FOLDER/mdpub.sh${Curl}[OPTIONS] $Ccmd[command]$Coff"
echo -e "${Ctxt}  $Curl [OPTIONS]$Coff"
echo -e "${Ctxt}  $Curl -h | --help      $Ctxt Display this help text$Coff"
echo -e "${Ctxt}  $Curl -i | --init      $Ctxt Make a new project in a folder called ${Cfile}template-init$Coff"
echo -e "${Ctxt}  $Curl -i | --panstall  $Ctxt Install ${Ccmd}Pandoc${Ctxt} executable$Coff"
echo -e "${Ctxt}  $Curl -q | --quiet     $Ctxt Be quiet - stop with all the chatty logging$Coff"
echo -e "${Ctxt}  $Curl -u | --update    $Ctxt Update the tools in the $Cfile$SCRIPT_FOLDER$Ctxt folder from github$Coff"
exit 0