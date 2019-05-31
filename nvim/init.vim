call plug#begin("~/.config/nvim/plugged")

" dark theme with some purple
Plug 'drewtempelmeyer/palenight.vim'

" fuzzy search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" file browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" A dependency of 'ncm2'.
Plug 'roxma/nvim-yarp'

" nice status bar
Plug 'vim-airline/vim-airline'

" closing pairs
Plug 'jiangmiao/auto-pairs'

" toggle comments
Plug 'scrooloose/nerdcommenter'

" show whitespaces and quick fix
Plug 'ntpeters/vim-better-whitespace'

" git stuffn 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" file content search like grep
Plug 'mileszs/ack.vim'

" multiple cursors like in sublime
Plug 'terryma/vim-multiple-cursors'

" language server support & languages
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'udalov/kotlin-vim'

call plug#end()

" nerd comments settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" disable coloring as nvim has nicer looking highlighting
" however we want the stripping of whitespaces
let g:better_whitespace_enabled=0

" theming, must be after plugins are applied
set background=dark
colorscheme palenight

" show line numbers in ruler
set number

" show cursor position
set ruler

" auto indent for convenience
set autoindent
set showcmd

" search
set incsearch
set ignorecase
set smartcase

" display hidden characters
set list

" shows matching pair
set showmatch

" tab stuff
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" highlight current line
set cursorline

" read/write file when switching buffers
set autowrite
set autoread

" copy/paste system wide
set clipboard=unnamedplus

" allows to undo after quitting files
set undofile
set undodir=/tmp

" complete longest in wildmenu with tab
set wildmode=list:longest,full

" Open buffers to right and below
set splitbelow
set splitright

" Split window vertically with |
map <Bar> <C-W>v<C-W><Right>

" Split window horizontally with _
map _ <C-W>s<C-W><Down>

" leader mappings
let mapleader="\<SPACE>"

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Toggle between normal and relative numbering.
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Key mappings
nnoremap <leader>tn :call NumberToggle()<cr>
nmap <silent><leader>/ <Plug>NERDCommenterToggle
vmap <silent><leader>/ <Plug>NERDCommenterToggle
nnoremap <leader>sw :StripWhitespace<cr>
nnoremap <leader>tt :NERDTreeToggle<cr>
nnoremap <leader>o :FZF<cr>
nnoremap <C-o> :FZF<cr>
nnoremap <leader>d yyp
nnoremap <leader>k dd
nnoremap <leader>l :nohlsearch<cr>
nnoremap <C-q> :q<cr>
nnoremap <C-s> :w<cr>
"" better movement for wrapped lines
nnoremap <up> gk
nnoremap <down> gj
nnoremap k gk
nnoremap j gj
"" move lines
noremap <M-up> :m -2<CR>
inoremap <M-up> <Esc>:m -2<CR>i
noremap <M-down> :m +1<CR>
inoremap <M-down> <Esc>:m +1<CR>i
" next/previous buffers
nmap <silent> ]b :bnext<cr>
nmap <silent> [b :bprev<cr>

" Use ';' for commands.
nnoremap ; :

" Search with Ack without jumping to first finding
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" copy current word
nnoremap <silent> <leader>cw vey
" paste last yank in insert mode
inoremap <silent> <C-v> <Esc>pa

" language server actions
nnoremap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gu <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gr <Plug>(coc-rename)
nmap <silent> <leader>fs <Plug>(coc-format-selected)
vmap <silent> <leader>fs <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vnoremap <leader>a <Plug>(coc-codeaction-selected)
nnoremap <leader>a <Plug>(coc-codeaction-selected)

" Use `[d` and `]d` for navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
" Format whole file
nmap <leader>ff ;Format<cr>

" Using CocList
"Show all diagnostics
nnoremap <silent> <space>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>le  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>lk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>lr :<C-u>CocListResume<CR>

" smarter code completion
"" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

"" completion with tab, shift+tab and enter
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y> " : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" show coc diagnostics in statusline
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
