syntax on

" coc settings
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=50
set shortmess+=c
set signcolumn=yes

" Share clipboard between Windows and Vim
set clipboard+=unnamedplus
set number
set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" set nohlsearch
set autoindent
set nowrap
set smartcase
set ignorecase
set noswapfile
set incsearch
set scrolloff=8
set noshowmode
" set fileformat=unix
" set fileformats=unix,dos
set pumheight=10
" set formatoptions-=cro
set splitright
set iminsert=0

" Save undo info
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile


set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mlaursen/vim-react-snippets'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-scripts/BufOnly.vim'
Plug 'farmergreg/vim-lastplace'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()

" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
set termguicolors
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let mapleader = " "

source $HOME/dotfiles/coc.vim 

" Windows
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <leader>w <C-w>
nnoremap <leader>qq :qa<CR>

" Buffers
nnoremap <leader><Tab> <C-^>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :BD<CR>
nnoremap <leader>bo :BufOnly<CR>

nnoremap <Down> <C-E>
nnoremap <Up> <C-Y>

" Cycling through listed buffers
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprevious<CR>
command! CloseOthers silent! execute "%bd|e#|bd#"

" Diff current buffer and the original file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Search commands/configs
nnoremap <C-p> :PFiles<CR>
nnoremap <leader>sc :History:<CR>
nnoremap <leader>sb :Lines<CR>
nnoremap <leader>fr :Recent<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <Leader>sf :Rg<SPACE>
vnoremap <Leader>sf "ay:Rg <C-R>A<CR>
vnoremap // "ay/\V<C-R>=escape(@a,'/\')<CR><CR>
command! -bang Open call fzf#vim#files('~', <bang>0)
command! -bang -nargs=? PFiles call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)
command! -bang -nargs=* Recent call fzf#vim#history({'options': '--no-preview'}, <bang>0)
command! -bar -bang -nargs=? -complete=buffer Buffers call fzf#vim#buffers(<q-args>, {'options': '--no-preview'}, <bang>0)
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_preview_window = 'down:60%'
let $FZF_DEFAULT_OPTS="--reverse"
" Replace paste yanked text in vim without yanking the deleted lines
vnoremap p pgvy
nnoremap c "_c
vnoremap c "_c

nmap <silent> <C-e> :CocCommand explorer<CR>
nmap <silent> <C-b> :CocCommand explorer --sources=buffer+ --position=floating --open-action-strategy=sourceWindow<CR>

nnoremap <silent> <C-l> :nohlsearch<return><C-l>

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:startify_session_persistence=1
let g:rooter_patterns = ['=src','.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile']

" let g:node_client_debug = 1
