# install pandoc on a linux system
DEB="pandoc-2.16.1-1-amd64.deb"
GOBACK="$(pwd)"
cd /tmp
curl -L https://github.com/jgm/pandoc/releases/download/2.16.1/$DEB --output $DEB
sudo dpkg -i $DEB
cd $GOBACK
