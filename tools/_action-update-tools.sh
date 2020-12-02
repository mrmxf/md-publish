# WARNING: this can't be undone!
URL=$(git config --get remote.origin.url)
if [ -z $QUIET ]; then echo -e "${Cwarning}    Non-reversible!$Cinfo Update tools from ${Curl}$URL${Cinfo}?$Coff"; fi

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
