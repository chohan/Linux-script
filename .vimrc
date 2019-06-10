set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

set nocompatible
set history=1000
set showmatch
set smartcase
set ignorecase
set incsearch
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set et
set bs=indent,eol,start
set filetype=on
set paste
set number						" line numbers
set ruler						" show line number in status bar
filetype on						" set file type detection ON
set exrc
set secure
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
set makeprg=make\ -C\ ../build\ -j9		" make command to compile (:make)
nnoremap <F4> :make!<cr>				" map make command to F4
nnoremap <F5> :!./my_great_program<cr>	" map F5 to run


let g:xml_syntax_folding = 1

" /usr/share/vim/vim74/colors/
syntax on
colorschem industry
 "darkblue,desert,elflord,delek,evening,industry,koehler,morning,murphy,pablo,peachpuff,ron,shine,slate,torte,zellner
