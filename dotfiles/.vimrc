" --------------------------------------------------------------------------------------------
" |									     Plugins                                             |
" --------------------------------------------------------------------------------------------

" Source Plugins file
source ~/.config-files/vim/plugins.vim

" ---- CtrlP ----
let g:ctrlp_custom_ignore = {
			\ 'dir': '\.git$\|\vendor$|node_modules|bower_components'
			\}

" --------------------------------------------------------------------------------------------
" |										 Mappings											 |
" --------------------------------------------------------------------------------------------

" Set the default leader key to ',' instead of '\'
let mapleader = ','

" Mapping to edit .vimrc
nmap <Leader>ev :e ~/.vimrc<cr>
" Mapping to edit vim plugins file
nmap <Leader>ep :e ~/.config-files/vim/plugins.vim<cr>

" Insert brackets
ino <Leader>ib {}
" Insert square brackets
ino <Leader>isb []
" Insert parentheses
ino <Leader>isp ()

" Go to end of line
nmap <Leader><Leader>e $
" Go to start of line
nmap <Leader><Leader>s 0

" Escape shortcut
ino jj <esc>

nmap <Leader><Leader><Leader><Leader><Leader> ichameleon

" Plugins

" NERDTree
nmap <Leader>n :NERDTreeToggle<cr>

" --------------------------------------------------------------------------------------------
"|                                      Auto-Commands                                         |
" --------------------------------------------------------------------------------------------

" Create a group to prevent commands getting added multiple times on source
augroup autosourcing
	autocmd!
	" Automatically source the .vimrc file on save
	autocmd BufWritePost .vimrc source %
	autocmd BufWritePost plugins.vim source ~/.vimrc
	autocmd BufWritePost plugins.vim :PluginInstall
	autocmd BufWritePost plugins.vim :bd \[Vundle]\ Installer
augroup end

" --------------------------------------------------------------------------------------------
" |										 Visual Stuff										 |
" --------------------------------------------------------------------------------------------

" Turn on syntax highlighting
syntax on

" Set colorscheme
colorscheme jellybeans " Some good ones, pablo / koehler / desert / slate

" --------------------------------------------------------------------------------------------
" |                                       General                                            |
" --------------------------------------------------------------------------------------------

" ---- Info ----

" This shows what you are typing as a command.
set showcmd

" Displays current mode
set showmode

" Line numbers
" set number

" Relative line numbers
set relativenumber

" ---- Display Options ----

" Set scrolloff area, I like to keep my selected line high
set scrolloff=10

" Indent width
set shiftwidth=4
set tabstop=4

" Show matching bracket
set showmatch

" ---- General ----

" Autmoatically change working directory to current file
" Disabled for fuzzy search
" set autochdir

" Set backspace button to work normally -.-
set backspace=2

" Turn off error bells
set noerrorbells
set novisualbell

" ---- Vim system files ----

" Set vim special files to use directories in the .vim directory to keep them
" out of sight for when you actually need them
" Turn on vim backups
set backup
set backupdir=~/.vim/backup//

" Turn on swap file incase vim crashes
set swapfile
set directory=~/.vim/swap//

" Turn on persistent undos, this will make your undo history available after
" closing and re-opening vim
set undodir=~/.vim/undo//
set undofile
