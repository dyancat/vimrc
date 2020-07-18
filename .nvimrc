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

"Theme
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'ericbn/vim-solarized'

"Features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-visual-star-search'

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
nnoremap / /\v
vnoremap / /\v
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


"GUI options
"---------------------------
colorscheme solarized
set background=dark

"Mappings
"---------------------------

let mapleader = ","
noremap \ ,

"Easier changing of windows
nnoremap <space> <C-w>w

"Easier navigation of command mode
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"CTRL-S for saving
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

"Buffer switching/closing/creating
nnoremap <C-TAB> :bn<CR>
nnoremap <C-S-TAB> :bp<CR>
nnoremap <leader>d :bp\|bd #<CR>
nnoremap <leader>D :bp\|bd! #<CR>
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

"XML formatting
nnoremap <leader>xml :set ft=xml<CR>:%s/>\s*</>\r<<CR>gg=G

"Commenting
nmap <Leader>/ gcc
vmap <Leader>/ gc

" move over wrapped lines
nnoremap j gj
nnoremap k gk

" Misc
nnoremap <leader><space> :noh<cr>
nnoremap <leader>== gg=G``
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
noremap 0 ^
noremap ^ 0

" Remap K to split lines (Steve Losh)
nnoremap K i<CR><Esc><Right>mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Remap J to split lines (Steve Losh)
nnoremap J mzJ`z

" Keep search matches in middle of window
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

" Use ctrl+hjkl to move between window splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
