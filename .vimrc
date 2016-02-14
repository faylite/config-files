" ----- General -----
" Autmoatically change working directory to current file
set autochdir

" ----- Visual ------

" Turn on syntax highlighting
syntax on

" Font

" Set colorscheme
" Downloaded good ones, luinnar
colorscheme jellybeans " Some good ones, pablo / koehler / desert / slate

" Set scrolloff area, I like to keep my selected line high
set scrolloff=10

" ----- Coding Format ------

" Tab width
set shiftwidth=4
set tabstop=4

" ------- Status Line ---------

" Set statusline to always show
set laststatus=2

" Shows line numbers
set ruler

" Create a informative status line
" Truncation point
set statusline=%< 
	" File name option [%F:Full path , %f:Relative path , %t:Just filename]
	set statusline+=%f " Display filename
	set statusline+=%y " Display file type
	set statusline+=%h " Help flag
	set statusline+=%w " Preview flag
	set statusline+=%r " Read-only flag
	set statusline+=%m " Add a modified flag when modified

set statusline+=%= " Right align
"	set statusline+=[%l,%v] " Display (l)ine number and (v)irtual column number
	set statusline+=[Line:\ %l:%L] " Current Line : Amount of lines
	set statusline+=[Position:\ %P] " Display position in percent

" ----- Coding Aids ----

" Line numbers
" set number
" Relative line numbers
set relativenumber

" Show matching bracket
set showmatch

" Got indentation?
set autoindent
set smartindent

" ---- Misc ---

" This shows what you are typing as a command.
set showcmd

" Displays current mode
set showmode

" Set backspace button to work normally -.-
set backspace=2

" Turn off error bells
set noerrorbells
set novisualbell

" Turn off vim bacups, I have git for that....
set nobackup

" Turn off annoying .swp files
set noswapfile

" Vundle {{{
	
set nocompatible	" be Improved, required
filetype off		" required

" set the runtime to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Airline, status line replacement
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" NERDTree, file explorer
Plugin 'scrooloose/nerdtree'

" Git Integration
Plugin 'tpope/vim-fugitive'

" Tmux Integration
Plugin 'tmux-plugins/vim-tmux'

" Vim colorschemes
Plugin 'flazz/vim-colorschemes'

" All Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required

" Brief help
" :PluginList	- lists configured plugins
" :PluginInstall	- installs plugins; append '!' to update or just :PluginUpdate
" :PluginSearch foo	- searches for foo; append '!' to refresh local cache
" :PluginClean		- confirms removal of unused plugins; append '!' to auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" End Vundle }}}

" Enable powerline fonts
let g:airline_powerline_fonts = 1
