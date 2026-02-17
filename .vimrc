" --- 1. AUTOMATIC PLUGIN MANAGER INSTALL ---
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --- 2. PLUGINS ---
call plug#begin('~/.vim/plugged')
  Plug 'joshdick/onedark.vim'          " Theme
  Plug 'preservim/nerdtree'            " File tree
  Plug 'itchyny/lightline.vim'         " Status bar
  Plug 'prabirshrestha/vim-lsp'        " LSP Client
  Plug 'mattn/vim-lsp-settings'        " LSP Auto-installer
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" --- 3. GENERAL SETTINGS ---
set nocompatible
filetype plugin indent on
syntax on
let mapleader = ","

" Indentation: Tabs by default, but spaces for Python/YAML to prevent errors
set tabstop=4
set shiftwidth=4
set noexpandtab
autocmd FileType python,yaml,json,markdown setlocal expandtab

" Visuals & Behavior
set relativenumber
set number
set cursorline
set termguicolors
set mouse=a
set undofile                           " Persistent undo
set hidden                             " Switch buffers without saving
set clipboard+=unnamedplus             " Wayland/X11 clipboard sync

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" --- 4. KEYBINDINGS ---
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
" Tab completion for LSP
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" --- 5. THEME & UI CONFIG ---
let g:lightline = { 'colorscheme': 'onedark' }

" Safety check: Only load onedark if it was successfully downloaded
try
  colorscheme onedark
catch
  colorscheme default
endtry
