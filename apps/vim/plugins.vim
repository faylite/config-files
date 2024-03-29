" --------------------------------------------------------------------------------------------
" |                                      VUNDLE Plugins                                      |
" --------------------------------------------------------------------------------------------

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

" ----------------------------------------------
" |               Plugins                      |
" ----------------------------------------------

" --------------- Airline ----------------------

" Airline, status line replacement
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

set laststatus=2

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" let g:airline_extensions=['ctrlp']
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" -------------- Nerdtree ----------------------

" NERDTree, file explorer
Plugin 'scrooloose/nerdtree'

" --------------- Other ------------------------

" Git Integration
Plugin 'tpope/vim-fugitive'

" Vim colorschemes
Plugin 'flazz/vim-colorschemes'

" CtrlP fuzzy file search
Plugin 'kien/ctrlp.vim'

" Auto-create directories when saving in non-existen dir
Plugin 'travisjeffery/vim-auto-mkdir'

" Surround with
Plugin 'tpope/vim-surround'

" Code completion
Plugin 'ervandew/supertab'

" Emmet HTML super powers
Plugin 'mattn/emmet-vim'

" Editor config for collab
Plugin 'editorconfig/editorconfig-vim'

" White space highlighting
Plugin 'ntpeters/vim-better-whitespace'

" Indentation guides
Plugin 'nathanaelkane/vim-indent-guides'

" Note-taking, etc
Plugin 'vimwiki/vimwiki'

" ctags bar (tagbar)
Plugin 'majutsushi/tagbar'

" Docker
Plugin 'docker/docker'
autocmd BufNewFile,BufRead *.dockerfile set syntax=dockerfile

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----------------------------------------------
" |              Language Plugins              |
" ----------------------------------------------

" Tmux config file
Plugin 'tmux-plugins/vim-tmux'

" PHP
Plugin 'StanAngeloff/php.vim'
" Laravel Blade
Plugin 'jwalton512/vim-blade'

" Powershell
Plugin 'PProvost/vim-ps1'
" C#.NET
Plugin 'OrangeT/vim-csharp'

" HTML5
Plugin 'othree/html5.vim'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'sorin-ionescu/vim-htmlvalidator'
au FileType html compiler html
au QuickFixCmdPost make cwindow
" Show matching tags
Plugin 'gregsexton/matchtag'
" Twig
Plugin 'evidens/vim-twig'

" TypeScript
Plugin 'HerringtonDarkholme/yats.vim'
" Vue.js
Plugin 'posva/vim-vue'
" SCSS / SASS
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
" Kotlin
Plugin 'udalov/kotlin-vim'

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
