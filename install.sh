set -e

SUCCESS=0
FAILURE=-1

# setup_<software_name>
# install_<software_name>
# is_<software_name>_installed

fn_exists()
{
  declare -f $1 > /dev/null; echo $?
}

install_brew()
{
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_nvim()
{
    brew install neovim
    dir="~/.config/nvim"
    if [[ ! -e $dir ]]; then
      echo "creating $dir"
      mkdir -p $dir
    fi
    echo "copying latest .vimrc"
    cp ./.vimrc ~/.vimrc
    echo "linking vimrc to init.vim"
    ln -s ~/.vimrc "$dir/init.vim"
    install_vimplug
}

install_vimplug()
{
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_zsh()
{
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_tmux()
{
  brew install tmux
}

install_nvm()
{
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.9/install.sh | bash
}

setup_tmux()
{
  brew install reattach-to-user-namespace
}

setup_nvim()
{
  ln -s ~/.vimrc ~/.config/nvim/init.vim
}

setup_zsh()
{
  cp ./.zshrc ~/.zshrc
}

install_python()
{
  brew install python@2
  brew install python3
}

setup_python()
{
  /usr/local/bin/pip install neovim
  /usr/local/bin/pip3 install neovim
}

is_powerline_installed()
{
  echo "calling is_powerline_installed"
  if test $(uname) = "Darwin" ; then
    if test ! -d "~/Library/Fonts" ; then
      return $SUCCESS
    else
      echo "powerline already installed"
    fi
  fi
  return $FAILURE # any non zero
}

install_powerline()
{
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
}

# create bind
# TODO
bind(){
  output=eval $0
  functionName=$1
  functionName output
}

install_all()
{
  to_install=( "zsh" "brew" "nvim" "tmux" "powerline" "nvm" )
  for software in ${to_install[@]}
  do
    if is_installed $software ; then
      echo "$software already installed"
    else
      fn_to_call="install_$software"
      if fn_exists $fn_to_call; then
        echo "installing $software"
        $fn_to_call
        setup_fn_to_call="setup_$software"
        if fn_exists $setup_fn_to_call ; then
          echo "setting up $software"
          $setup_fn_to_call
        else
          echo "$setup_fn_to_call does not exist so not calling"
        fi
      else
        echo "$fnToCall does not exist so not calling"
      fi
    fi
  done
}

is_installed()
{
  # if is_<software_name>_installed exists call it else use default
  fn_to_call="is_$1_installed"
  if fn_exists $fn_to_call; then
    echo "calling $fn_to_call"
    $fn_to_call
  else
    if [[ $(which $1) ]]; then
      return $SUCCESS
    else
      return $FAILURE
    fi
  fi
}

install_all
