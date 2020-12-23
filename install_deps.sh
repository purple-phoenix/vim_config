# Get NAME=Fedora or whichever distro line
# then cut out everything before =
DISTRO=`cat /etc/os-release | grep -Eo -m 1 'NAME=([A-Za-z]*)'\
  | cut -d "=" -f2`
echo On $DISTRO
echo "Installing dependencies"
if [[ "$DISTRO" == "Ubuntu" ]]; then
  apt-get install -y neovim npm gcc g++ cmake python-dev golang
fi

if [[ "$DISTRO" == "Fedora" ]]; then
  dnf install -y neovim npm gcc g++ cmake python-devel golang
fi
