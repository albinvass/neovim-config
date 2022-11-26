set nocompatible
syntax on
filetype plugin indent on
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set hlsearch
set colorcolumn=80
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set rtp+=~/.fzf

let mapleader=","

nnoremap<leader><space> :nohlsearch<CR>
nmap <C-p> :Telescope find_files<CR>
nmap <C-e> :Telescope live_grep<CR>


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead Jenkinsfile setf groovy

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:nvim_tree_auto_open = 1
nnoremap <C-n> :NvimTreeToggle<CR>

lua << EOF
    require'plugins'
    require'lspconfig'
    require'completion'
EOF
