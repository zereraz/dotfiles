let mapleader = ","
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'raichoo/purescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs' " for autocomplete of [ , ( etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'frigoeu/psc-ide-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-obsession'
" Plug 'ternjs/tern_for_vim'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'Shougo/denite.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

syntax on
filetype on
filetype plugin indent on
set number

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
colorscheme gruvbox
set background=dark    " Setting dark mode

nnoremap ; :

" to enable deoplete
let g:deoplete#enable_at_startup = 1

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

" ctrlsf plugin (find all in sublime)

" ctrl space
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceSetDefaultMapping = 1
let g:CtrlSpaceSearchTiming = 500
nnoremap <silent><C-Space> :CtrlSpace O<CR> " https://github.com/vim-ctrlspace/vim-ctrlspace#fuzzy-search-hints

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
