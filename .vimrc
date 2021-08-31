" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=/d/Projects/Linux-script/.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"############################################

"no <down> <Nop>
"no <left> <Nop>
"no <right> <Nop>
"ino <down> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
"vno <down> <Nop>
"vno <left> <Nop>
"vno <right> <Nop>
"vno <up> <Nop>


set nocompatible
set path=**
set history=1000
set showmatch
set smartcase
set ignorecase
set incsearch
set hlsearch
set et
set bs=indent,eol,start
set filetype=on
set number					" line numbers
set ruler						" show line number in status bar
set exrc
set secure
set autoindent
set smartindent
set expandtab				" convert tab character to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set colorcolumn=110
set paste
set hidden					" allow switching buffers without saving
set clipboard=unnamped		"
filetype on						" set file type detection ON
highlight ColorColumn ctermbg=darkgray
set makeprg=make\ -C\ ../build\ -j9		" make command to compile (:make)

" mappings
":nmap - Display normal mode maps
":imap - Display insert mode maps
":vmap - Display visual and select mode maps
":smap - Display select mode maps
":xmap - Display visual mode maps
":cmap - Display command-line mode maps
":omap - Display operator pending mode maps

nmap uc gUiW				" to upper case
nmap lc guiW				" to lower case
nnoremap <F4> :make!<cr>				" map make command to F4
nnoremap <F5> :!./my_great_program<cr>	" map F5 to run


"let g:xml_syntax_folding = 1

" /usr/share/vim/vim74/colors/
syntax on
colorscheme torte
 "solarized,torte,cobalt2,darkblue,desert,elflord,delek,evening,industry,koehler,morning,murphy,pablo,peachpuff,ron,shine,slate,torte,zellner
"set background=dark

