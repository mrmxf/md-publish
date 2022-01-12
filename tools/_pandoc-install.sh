# install pandoc on a linux system
DEB="zmp/tools/pandoc-amd64.deb"
GOBACK="$(pwd)"
# cd /tmp
# curl -L https://github.com/jgm/pandoc/releases/download/2.16.1/$DEB --output $DEB
sudo dpkg -i $DEB
#cd $GOBACK
echo -e "${Ctxt}Installed ${Ccmd}$(pandoc --version | awk '{print $1" "$2" "$3; exit}')$Coff"
exit 0
