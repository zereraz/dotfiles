set -e

is_installed()
{
  if [[ $(which $1) ]]; then
    return 0
  else 
    return 1
  fi
}

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
    setup_zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_tmux()
{
  brew install tmux
}

setup_zsh()
{
  cp ./.zshrc ~/.zshrc
}

install_python()
{
  brew install python@2
  brew install python
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
  to_install=( "zsh" "brew" "nvim" "tmux" )
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
        echo $setup_fn_to_call
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

install_all
