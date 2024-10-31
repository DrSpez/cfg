"
" Vundle stuff:
"
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/CycleColor'
Plugin 'sheerun/vim-polyglot'

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to 
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Put your non-Plugin stuff after this line   

"PEP-8 indentation   
setlocal softtabstop=4
setlocal textwidth=80
setlocal smarttab
set tabstop=4 shiftwidth=4 expandtab

syntax on
filetype indent plugin on

" Neovim compatibility
let $LANG = "C" " Set locale to english
let $TERM = "xterm-256color" " Allow colors

set number
set relativenumber
set mouse=a
set t_Co=256
colorscheme jellybeans

" Highlight current line
set cursorline

" Highlight 80th column
set colorcolumn=80
highlight ColorColumn ctermbg=23

" Use system clipboard
set clipboard=unnamedplus

" Toggle paste mode with F3
set pastetoggle=<F3>

" Run Python with F5
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>s :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬
"
" Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Map ; to :
map ; :

" Swap lines
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Unbind arrowkeys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" EasyMotion binds
let g:EasyMotion_smartcase = 1

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-bd-tl)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion "

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev) "

" NERDTree
nmap <silent> <C-T> :NERDTreeToggle<CR>

" Fix tree '~V' bug
let g:NERDTreeDirArrows=0 
" Hide undesired files
let NERDTreeIgnore = ['\.pyc$']

echo "My .vimrc loaded"
