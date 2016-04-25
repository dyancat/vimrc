set nocompatible

"Plugins
"---------------------------
call plug#begin('~/.vim/plugged')

"UI
Plug 'romainl/flattened'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'dzeban/vim-log-syntax'

"Functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'bronson/vim-visual-star-search'
Plug 'terryma/vim-multiple-cursors'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'ervandew/supertab'

"Development
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'alvan/vim-closetag'

"Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'othree/javascript-libraries-syntax.vim'

"Misc
Plug 'irrationalistic/vim-tasks'

call plug#end()


"Settings
"---------------------------
set autoindent
set comments+=:☐
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autochdir

set encoding=utf-8
set scroll=5
set scrolloff=3
set nobackup
set noswapfile
nnoremap / /\v
vnoremap / /\v
set incsearch
set gdefault
set hlsearch
set ignorecase
set smartcase
set wrap
set textwidth=100
set formatoptions=qrn1

set number
set ruler
set showcmd
set showmode
set laststatus=2
set hidden
set foldmethod=indent
set foldlevelstart=20

set autoread
set lazyredraw
set wildmenu

syntax enable


"GUI options
"---------------------------
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
colorscheme gruvbox
set background=dark

if has("gui_running")
    set guifont=Consolas:h11

    set guioptions-=T "remove toolbar
    set guioptions-=m "remove menubar
    set guioptions-=r "remove right-hand scrollbar
    set guioptions-=L "remove left-hand scrollbar
endif

"ctrlp
"---------------------------
let g:ctrlp_root_markers = ['package.json']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"vim-session
"---------------------------
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

"Syntastic
"---------------------------
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exec = 'eslint_d'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Airline
"---------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'

"vim-tasks
"---------------------------
autocmd FileType help wincmd L
autocmd BufNewFile,BufReadPost *.TODO,TODO,*.todo,*.todolist,*.taskpaper,*.tasks set filetype=tasks

"Prevent bn/bp from switching to/from these
"---------------------------
augroup qf
    autocmd!
    autocmd FileType qf,nerdtree,undotree,diff noremap <buffer> <C-TAB> <nop>
    autocmd FileType qf,nerdtree,undotree,diff noremap <buffer> <C-S-TAB> <nop>

    autocmd FileType qf,nerdtree,undotree,diff set nobuflisted
augroup END

"vim-closetag
"---------------------------
let g:closetag_filenames = "*.js,*.jsx,*.html,*.xhtml,*.phtml"

"quick-scope
"---------------------------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"supertab
"---------------------------
let g:SuperTabDefaultCompletionType = "context"

"Mappings
"---------------------------
let mapleader = ","
noremap \ ,

"Easier changing of windows
nnoremap <space> <C-w>w

"Buffer toggles
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :UndotreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

"Easier navigation of command mode
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"CTRL-S for saving
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

"Buffer switching/closing/creating
nnoremap <C-TAB> :bn<CR>
nnoremap <C-S-TAB> :bp<CR>
nnoremap <C-c> :bp\|bd #<CR>
nnoremap <C-t> :enew<CR>

"Easier yanking/pasting from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
nnoremap <leader>op o<ESC>"+p
nnoremap <leader>oP O<ESC>"+P

"Easier vimrc editing/reloading
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>V :so $MYVIMRC<CR>

"JSON formatting
nnoremap <leader>j :set ft=json<CR>:%!python -m json.tool<CR>

"Macro editing
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

"Commenting
nmap <Leader>/ gcc
vmap <Leader>/ gc

"%% in command mode expands to current dir
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h') : '%%'

"Misc
nnoremap <leader><space> :noh<cr>
nnoremap <leader>b :ls<CR>
nnoremap <leader>== gg=G``
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
noremap 0 ^
noremap ^ 0
