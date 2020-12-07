mkdir -p ~/.config/nvim/autoload
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -O ~/.config/nvim/autoload/pathogen.vim

git submodule update --init --recursive
cp ./init.vim $HOME/.config/nvim/init.vim
