# check to see if we need to do an update

URL=$(git config --get remote.origin.url)

#fetch remote data and check status
git fetch --quiet
STATUS=$(git status -sb)
NEED_UPDATE=""
if [[ "$STATUS" == *"behind"* ]] ; then NEED_UPDATE="yes" ; fi

if [[ -z "$NEED_UPDATE" ]] ; then
  if [ -z $QUIET ]; then echo -e "${Ctxt}                 >>$Cinfo You are up to date with ${Curl}$URL${Cinfo}$Coff"; fi
  exit 0
fi

if [ -z $QUIET ]; then echo -e "${Cwarning}    Non-reversible!$Cinfo Do you want to update tools from ${Curl}$URL${Cinfo}?$Coff"; fi

select yn in "Yes" "No"; do
    case $yn in Yes) break ;; No) exit ;; esac
done

cd $SCRIPT_FOLDER
if [ -z $QUIET ]; then echo -e "${Ctxt}    reset local git$Cinfo ${Ccmd}git reset --hard HEAD$Coff"; fi
git reset --hard HEAD
if [ -z $QUIET ]; then echo -e "${Ctxt}    clean local git$Cinfo ${Ccmd}git clean -f -d$Coff"; fi
git clean -f -d
if [ -z $QUIET ]; then echo -e "${Ctxt}   pull from remote$Cinfo ${Ccmd}git pull$Coff"; fi
git pull
exit 0
