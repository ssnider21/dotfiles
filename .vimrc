set nocompatible              " required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'davidhalter/jedi-vim'
" Plugin 'lambdalisue/vim-pyenv'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'PProvost/vim-ps1'

" enable syntax highlighting
syntax enable
syntax on

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1
let typescript_highlight_all = 1

" sets esc to jk
inoremap jk <esc>

" sets B to ^ (beginning of line)
map B ^

" sets E to $ (end of line)
map E $

" sets control + b to delete word in insert
inoremap <C-b> <C-o>db

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


" sets tab control
nmap <F1> 1gt
nmap <F2> 2gt
nmap <F3> 3gt
nmap <F4> 4gt
nmap <F5> 5gt
nmap <F6> 6gt
nmap <F7> 7gt
nmap <F8> 8gt
nmap <F9> 9gt

" copy/paste stuff
set clipboard=unnamed
set rnu

" syntastic stuff
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_quiet_messages = { "regex": ["E501", "snake_case naming style"] }
" let g:syntastic_debug = 3
command Flake8 SyntasticCheck<Space>flake8
command Pylint SyntasticCheck<Space>pylint

" ale stuff
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1

" fix for sessions
set sessionoptions-=options

" colorscheme
"colorscheme dracula

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" NERDTree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
map <C-o> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" add python stuffs
au! BufNewFile,BufReadPost *.py set foldmethod=indent

hi Comment ctermfg=86


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
