set t_Co=256

let g:molokai_original = 1

noremap <F3> :let @/=''<CR>

" Fast close

map <C-Q> :q <CR>
nnoremap <C-Q> :q <CR>
imap <C-Q> <ESC> :q<CR> i
vmap <C-Q> <ESC> :q<CR> v

" Fuzzy Finder

map <C-K> :CtrlP<CR>
imap <C-K> <ESC>:CtrlP<CR> i
vmap <C-K> <ESC>:CtrlP<CR> v

" Copy
noremap <C-Insert> "+y<CR>
nmap <leader>y "+2yy<CR>
vmap <leader>y "+2yy<CR>

" Paste
noremap <S-Insert> "+gP<CR>
nmap <leader>p "+p
vmap <leader>p "+p

" Cut
noremap <C-Delete> "+x<CR>
nmap <leader>d "+dd
vmap <leader>d "+dd
" reload current file
map <C-F5> :edit! <CR>
map <F9> :TlistToggle<CR>
imap <F9> <Esc> :TlistToggle <CR><ESC> i
vmap <F9> <Esc> :TlistToggle <CR> <ESC> v

map <C-s> :w<CR>
imap <C-s> <Esc> :w<CR>i
map <C-F7> :update <CR> :e ++ff=dos <CR> :setlocal ff=unix <CR> :w
map <F9> :TlistToggle <CR>
imap <F9> <Esc> :TlistToggle <CR> i
vmap <F9> <Esc> :TlistToggle <CR> v

" show linenumbers
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set autoindent

" Paste functions
imap <S-Insert> <ESC> :set paste <CR> "+gP <CR> :set nopaste <CR> i
nmap <S-Insert> <ESC> :set paste <CR> "+gP <CR> :set nopaste <CR> i
vmap <C-Insert> "+y
vmap <C-p> "+y
vmap <C-Delete> "+x
nmap <C-Delete> "+yy <CR> dd
" autosave when changing buffer
imap <S-END> <ESC> V <END>
set autowrite
set nobackup

set hlsearch
set incsearch
set sm
syntax on


set ruler
set showmode
set history=1000

set ls=2
set title

" relative line numbers
:au FocusLost * :set nu
:au FocusGained * : set rnu

function! NumberToggle()
    if(&relativenumber == 1)
        set nu
    else
        set rnu
    endif
endfunc

nnoremap <C-F12> :call NumberToggle() <cr>
map <C-F12> :call NumberToggle() <cr>
set rnu


set ttyfast

set tabpagemax=15
nnoremap <A-PageUp> <Esc>:tabnext<CR>
nnoremap <C-PageUp> <Esc>:bn<CR>
nnoremap <C-t> <Esc>:tabnew<CR>
nnoremap <A-PageDown> <Esc>:tabprevious<CR>
nnoremap <C-PageDown> <Esc>:bp<CR>

" buffer navigating
nnoremap <C-S-Left> <Esc>:bp<CR>
nnoremap <C-S-Right> <Esc>:bn<CR>

set mouse=a
au Filetype python source ~/.vim/pythonvimrc

" -------------------------------------------------------------
" splits

"window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
map <leader>w :w <CR>
"navigate into splits

nmap <leader>s<left>   :wincmd h<CR>
nmap <leader>s<right>  :wincmd l<CR>
nmap <leader>s<up>     :wincmd k<CR>
nmap <leader>s<down>   :wincmd j<CR>

" xml auto indentation
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"


" 80 characters line
let &colorcolumn=join(range(81,999),",")
hi ColorColumn guibg=#2d2d2d ctermbg=235

" highlight current line
set cursorline


" vsplit style
set fillchars=vert:\│

" no wraplines
set nowrap


" NERDTree
let g:NERDTreeWinPos = "right"
imap <F12> <ESC> :NERDTreeToggle <CR> i
map <F12> :NERDTreeToggle <CR>
vmap <F12> <ESC> :NERDTreeToggle <CR> v

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala
autocmd BufWritePre *.py :%s/\s\+$//e

au BufNew,BufRead *.pi                  setf python

let g:rehash256 = 1

set wildignore+=*/build/bdist*,*/build/lib.*,*/dist/*,*/docs/*,*.egg-info,*.sw*,*.egg,*.exe,*.pyc,*.pyo,*.pyd,*.dll,*.so
source ~/.vim/vundles.vim
syn on
"source ~/.vim/python-mode.vim

" powerline vim
"
colorscheme xoria256
colorscheme molokai


" ctags c++
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/stl
set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-S-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
