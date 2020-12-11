## mdpub update tools from github script
## (C) MrMXF 2020
##
## issues https://github.com/mrmxf/md-publish/issues
##
##
# check to see if we need to do an update

URL=$(git config --get remote.origin.url)

#fetch remote data and check status
cd $SCRIPT_FOLDER
ORIGIN_FOLDER=$( pwd )
git fetch --quiet
STATUS=$(git status -sb)
NEED_UPDATE=""
if [[ "$STATUS" == *"behind"* ]] ; then NEED_UPDATE="yes" ; fi

if [[ -z "$NEED_UPDATE" ]] ; then
  if [ -z $QUIET ]; then echo -e "${Ctxt}                 >>$Cinfo You are up to date with ${Curl}$URL${Cinfo}$Coff"; fi
fi

if [ -z $QUIET ]; then echo -e "${Cwarning}    Non-reversible!$Cinfo Do you want to update tools from ${Curl}$URL${Cinfo}?$Coff"; fi

select yn in "Yes" "No"; do
    case $yn in Yes) break ;; No)   cd $ORIGIN_FOLDER ; exit ;; esac
done

if [ -z $QUIET ]; then echo -e "${Ctxt}    reset local git$Cinfo ${Ccmd}git reset --hard HEAD$Coff"; fi
git reset --hard HEAD
if [ -z $QUIET ]; then echo -e "${Ctxt}    clean local git$Cinfo ${Ccmd}git clean -f -d$Coff"; fi
git clean -f -d
if [ -z $QUIET ]; then echo -e "${Ctxt}   pull from remote$Cinfo ${Ccmd}git pull$Coff"; fi
git pull
cd $ORIGIN_FOLDER
exit 0
