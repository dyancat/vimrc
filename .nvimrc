"----------------------------
"---  Configure vim-plug  ---
"----------------------------
"Run the following powershell (from https://github.com/junegunn/vim-plug)
"
"md ~\AppData\Local\nvim-data\site\autoload
"$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"(New-Object Net.WebClient).DownloadFile(
"  $uri,
"  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"    "~\AppData\Local\nvim-data\site\autoload\plug.vim"
"  )
")
"
"Ensure git is executable from cmd 
"Then run :PlugInstall

"----------------------------
"--------  Plugins  ---------
"----------------------------
call plug#begin()

" Theme
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'ericbn/vim-solarized'

" Features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-visual-star-search'
Plug 'itchyny/lightline.vim'

call plug#end()

"---------------------------
"-------  Settings ---------
"---------------------------

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autochdir
set scrolloff=3
set nobackup
set noswapfile
set gdefault
set ignorecase
set smartcase
set nowrap
set number
set hidden
set foldmethod=indent
set foldlevelstart=20
set lazyredraw

syntax enable
colorscheme cobalt2
set background=dark

"---------------------------
"-------  Mappings ---------
"---------------------------

let mapleader = ","
noremap \ ,

" Default search mode
nnoremap / /\v
vnoremap / /\v

" Window navigation
nnoremap <space> <C-w>w
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Buffer management
nnoremap <C-TAB> :bn<CR>
nnoremap <C-S-TAB> :bp<CR>
nnoremap <leader>d :bp\|bd #<CR>
nnoremap <leader>D :bp\|bd! #<CR>
nnoremap <C-t> :enew<CR>

" CTRL-S for saving
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" Yanking/pasting from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
vnoremap <leader>Y "+Y

" vimrc editing
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>V :so $MYVIMRC<CR>

" Formatting
nnoremap <leader>j :set ft=json<CR>:%!python -m json.tool<CR>
nnoremap <leader>xml :set ft=xml<CR>:%s/>\s*</>\r<<CR>gg=G

" Commenting
nmap <Leader>/ gcc
vmap <Leader>/ gc

" Move over wrapped lines
nnoremap j gj
nnoremap k gk

" Misc
nnoremap <leader><space> :noh<cr>
nnoremap <leader>== gg=G``
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
noremap 0 ^
noremap ^ 0

" Remap J to split lines (Steve Losh)
nnoremap J mzJ`z

" Keep search matches in middle of window
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
