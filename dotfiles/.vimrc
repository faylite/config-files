" --------------------------------------------------------------------------------------------
"|                                       Mappings                                             |
" --------------------------------------------------------------------------------------------

" Set the default leader key to ',' instead of '\'
let mapleader = ','

" Mapping to edit .vimrc
nmap <Leader>ev :e ~/.vimrc<cr>
nmap <Leader>ep :e ~/.config-files/vim/plugins.vim<cr>

" Escape shortcut
ino jj <esc>

" Go to end of line
nmap <Leader><Leader>e $
" Go to start of line
nmap <Leader><Leader>s 0

" --------------------------------------------------------------------------------------------
"|                                     Visual Stuff                                           |
" --------------------------------------------------------------------------------------------

" Turn on syntax highlighting
syntax on

" Set colorscheme
colorscheme jellybeans " Some good ones, pablo / koehler / desert / slate

" --------------------------------------------------------------------------------------------
"|                                      Auto-Commands                                         |
" --------------------------------------------------------------------------------------------

" Create a group to prevent commands getting added multiple times on source
augroup autosourcing
	autocmd!
	" Automatically source the .vimrc file on save
	autocmd BufWritePost .vimrc source %
	autocmd BufWritePost plugins.vim source ~/.vimrc :PluginInstall
augroup end

" Source Plugins file
source ~/.config-files/vim/plugins.vim


" --------------------------------------------------------------------------------------------
"|                                        General                                             |
" --------------------------------------------------------------------------------------------

" Set scrolloff area, I like to keep my selected line high
set scrolloff=10


" This shows what you are typing as a command.
set showcmd

" Displays current mode
set showmode

" Set backspace button to work normally -.-
set backspace=2

" Tab width
set shiftwidth=4
set tabstop=4

" Turn off error bells
set noerrorbells
set novisualbell

" Autmoatically change working directory to the same directory as the current file (Disabled for fuzzy search)
" set autochdir

" Turn off vim bacups, I have git for that....
set nobackup

" Turn off annoying .swp files
set noswapfile

" Show matching bracket
set showmatch

" Indentation
set autoindent
set smartindent
