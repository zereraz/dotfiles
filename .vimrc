let mapleader = ","
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
" vim themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

" golang
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" purescript
Plug 'purescript-contrib/purescript-vim'
Plug 'frigoeu/psc-ide-vim'

" html
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'

" comments
Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs' " for autocomplete of [ , ( etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-obsession'
" Plug 'ternjs/tern_for_vim'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'Shougo/denite.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-sleuth'

" note taking
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mtth/scratch.vim'


call plug#end()

syntax on
filetype on
filetype plugin indent on
set number
set formatoptions+=o

set nocompatible
set hidden
"set showtabline=0 " removes the tabline

" set to auto read when file changed from outside
set autoread

" ignore case when searching
set ignorecase

" Fast save
nmap <leader>w :w!<cr>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

" Cut to clipboard
vnoremap  <leader>d  "+d
nnoremap  <leader>d  "+d

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " see hidden files

" for tabs to spaces and for 2 space as a tab
set expandtab " for tabs to spaces
set tabstop=2 " one tab is 2 spaces
set shiftwidth=2 " indents width 2
set softtabstop=2 "no. of columns for a TAB

" enable powerline font
let g:airline_powerline_fonts=1

" use 256 colors
set t_Co=256

"matching brakcets
set showmatch
" how many tenths of a second to blink when matching brackets
set mat=2

" map <Space> to / (search)
map <space> /
" removed due to ctrl space
" map <c-space> ?

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" pressing tab toggles, shift tab toggles back
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" iterm2 nightly
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"color scheme
" gruvbox old theme
colorscheme dracula

"colorscheme munich

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark    " Setting dark mode

let g:airline_theme='dracula'

" why commented? was trying g; , need to find what it is
" nnoremap ; :


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#sources#go = 'vim-go'
" let g:deoplete#complete_method = 'omnifunc'


" more natural split direction
set splitbelow
set splitright

" purescript ide
au FileType purescript nmap <leader>t :PSCIDEtype<CR>
au FileType purescript nmap <leader>i :PSCIDEimportIdentifier<CR>

" Grepper - to find files, find all etc
" nnoremap <leader>G :Grepper -tool ag<cr>
" nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr><Paste>

" ctrl + c to quit - mainly to close buffers/windows
nnoremap <C-C> :q<cr>

" denite ====================


"call denite#custom#var('file_rec', 'command',	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Change mappings.
" call denite#custom#map(
"       \ 'insert',
"       \ '<C-j>',
"       \ '<denite:move_to_next_line>',
"       \ 'noremap'
"       \)
" call denite#custom#map(
"       \ 'insert',
"       \ '<C-k>',
"       \ '<denite:move_to_previous_line>',
"       \ 'noremap'
"       \)
"
" " Change matchers.
"  call denite#custom#source(
"   \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
"  call denite#custom#source(
"   \ 'file_rec', 'matchers', ['matcher_cpsm'])
"
" " Change sorters.
"  call denite#custom#source(
"   \ 'file_rec', 'sorters', ['sorter_sublime'])
"
" nnoremap <space><space> :Denite file_rec -quick-match -auto-preview -winheight=10 <cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" enables mouse support
set mouse=a


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" switching between buffers/windows (right now with shift but should use alt
" or some other key)
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" golang
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" commented as would make it too slow
" let g:go_auto_type_info = 1 " when cursor is on a valid identifier
" set updatetime=100 " for quick update of statusline

" html
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,gohtml EmmetInstall

" https://stackoverflow.com/a/1295244
set incsearch
" example usage
" /old text
" :%s//replaced text/

" terminal escape
tnoremap <Esc> <C-\><C-n>
