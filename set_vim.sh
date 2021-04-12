DISTRO="Ubuntu"

echo "Making autoload directory"
mkdir -p ~/.config/nvim/autoload
echo "Downloading pathogen from github"
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -O ~/.config/nvim/autoload/pathogen.vim

echo "Updating submodules"
cd .config/nvim/bundle && git submodule update --init --recursive

echo "Installing YouCompleteMe dependencies"
if [[ "$DISTRO" == "Ubuntu" ]]; then
  apt-get install cmake
fi

if [[ "$DISTRO" == "Fedora" ]]; then
  dnf install cmake
fi

echo "Building YouCompleteMe"
python3 ~/.config/nvim/bundle/YouCompleteMe/install.py --all

cp ./init.vim $HOME/.config/nvim/init.vim
cp ./.vimspector.json $HOME/git/.vimspector.json
