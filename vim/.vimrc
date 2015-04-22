" ----- Visual ------

" Turn on syntax highlighting
syntax on
colorscheme monokai

" Set font
set guifont=Prestige_Elite_Std:h14

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

" Line numbers :D
set number

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

