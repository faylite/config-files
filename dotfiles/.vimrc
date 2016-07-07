" --------------------------------------------------------------------------------------------
" |                                      General                                             |
" --------------------------------------------------------------------------------------------

" Autmoatically change working directory to current file
" Disabled for fuzzy search
" set autochdir

" --------------------------------------------------------------------------------------------
" |                                      Mappings                                            |
" --------------------------------------------------------------------------------------------

" Set the default leader key to ',' instead of '\'
let mapleader = ','

" Mapping to edit .vimrc
nmap <Leader>ev :tabedit ~/.vimrc<cr>

" Escape shortcut
ino jj <esc>

" ---- Auto-Commands ----

" Create a group to prevent commands getting added multiple times on source
augroup autosourcing
	autocmd!
	" Automatically source the .vimrc file on save
	autocmd BufWritePost .vimrc source %
augroup end

" --------------------------------------------------------------------------------------------
" |                                      Visual Stuff                                        |
" --------------------------------------------------------------------------------------------

" Turn on syntax highlighting
syntax on

" Set colorscheme
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
set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Airline, status line replacement
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" let g:airline_extensions=['ctrlp']
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDTree, file explorer
Plugin 'scrooloose/nerdtree'
" Map NERDTree to Control + n
map <C-n> :NERDTreeToggle<CR>

" Git Integration
Plugin 'tpope/vim-fugitive'

" Vim colorschemes
Plugin 'flazz/vim-colorschemes'

" CtrlP fuzzy file search
Plugin 'kien/ctrlp.vim'

" Auto-create directories when saving in non-existen dir
Plugin 'travisjeffery/vim-auto-mkdir'

" ---------- Syntax plugins -----------
" PHP
Plugin 'StanAngeloff/php.vim'
" Tmux config file
Plugin 'tmux-plugins/vim-tmux'
" Laravel Blade
Plugin 'jwalton512/vim-blade'
" Powershell
Plugin 'PProvost/vim-ps1'
" C#.NET
Plugin 'OrangeT/vim-csharp'

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