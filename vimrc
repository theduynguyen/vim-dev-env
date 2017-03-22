" Install plugins
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'davidhalter/jedi-vim'
Plugin 'okcompute/vim-python-motions'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'wincent/terminus'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" editor settings

set encoding=utf-8
" line numbers
set nu

" use same clipboard as other programs
set clipboard=unnamed

" highlight search
set hlsearch

" new search after every typed char 
set incsearch

" 256 colour setting
set t_Co=256
set term=screen-256color

" Enable folding
set foldmethod=indent
set foldlevel=99

" line wrap
set textwidth=100
set wrap
set linebreak
set formatoptions-=t

syntax on
let python_highlight_all=1
set cursorline

" do not annoy me
set completeopt=menu
set backspace=indent,eol,start
set wildmode=longest,list,full
set wildmenu
set autoindent
set smartindent

" .py file specific
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd FileType py autocmd BufWritePre <buffer> %s/\s\+$//e


" key mappings
"Leader key
let mapleader=","

nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move vertically by visual line
nnoremap j gj
nnoremap k gk

"unhighlight search
nnoremap <esc><esc> :noh<return>

"Enable folding with the spacebar
nnoremap <space> za

"show Nerdtree
nnoremap <Leader>f :NERDTreeToggle<Enter>

"find in Nerdtree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

nmap OO O<Esc>
nmap oo o<Esc>
inoremap jk  <Esc> 
"
" Powerline - Always show statusline
set laststatus=2

" Nerdtree options
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1


" change colorscheme
if filereadable( expand("$HOME/.vim/bundle/molokai/colors/molokai.vim") )
    colorscheme molokai
endif

