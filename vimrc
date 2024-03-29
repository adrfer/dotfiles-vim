" For more info about vimrc, open vim and run:
"
"    :help vimrc-intro

" --
" General
" --

" Use vim settings rather than vi's
set nocompatible

" Allow unrestricted backspacing in insert mode
set backspace=eol,start,indent

" Save file before running commands
set autowrite

" Reload opened files changed elsewhere
set autoread

" Use only vertical splits for diffs
set diffopt+=vertical

" Avoid keeping backup and swap files
set nobackup nowritebackup noswapfile

" Wait less time for commands to complete
set timeout timeoutlen=3000 ttimeoutlen=100

" Allow current buffer be put on background w/o saving
set hidden

" Do not redraw buffer when executing macros
set lazyredraw

" --
" User Interface
" --

" Show title on terminal window
set title

" Configure custom 16-color palette and scheme
let g:onedark_termcolors=16
colorscheme onedark

" Do not show the intro message when starting the editor
set shortmess+=I

" Enable syntax highlighting
syntax on

" Highlight current line in the active window, but not in insert mode
augroup cursorline
  autocmd!
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup end

" Show absolute and relative line numbers with defined width
set number relativenumber numberwidth=5

" Show the status line as the second last line
set laststatus=2

" Set up a simple yet more informative status line
set statusline=%<%F
set statusline+=%(\ %{&readonly!=0?'[readonly]':''}%)
set statusline+=%(\ %{&modified?'[modified]':''}%)
set statusline+=%=
set statusline+=\ [l:\ %l/%L\ (%p%%)]
set statusline+=\ [c:\ %c]
set statusline+=\ [%{&fileformat}]
set statusline+=%(\ [%{&fileencoding}]%)
set statusline+=%(\ [%{&filetype}]%)

" Show incomplete commands on the bottom right
set showcmd

" Show visual autocomplete menu for commands
set wildmenu

" Ignore specified file patterns during autocomplete
set wildignore+=.git,.svn
set wildignore+=*.swp,.DS_Store
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar

" Highlight matching braces
set showmatch

" Show the preferred line length used for wrapping
set textwidth=80

" Open new split panes to the right and bottom
set splitbelow splitright

" Show custom invisible characters for tabs, eol, etc.
set listchars=tab:▸\ ,trail:·,eol:¬,space:␣,extends:»,precedes:«

" Show custom invisible chararter at the start of wrapped lines
set showbreak=↪\

" Deal with comment leader after joining and inserting lines
set formatoptions+=j
set formatoptions-=o

" Auto-indent numbered lists
set formatoptions+=n

" Resize splits when window is resized
augroup window
  autocmd!
  autocmd VimResized * :wincmd =
augroup end

" --
" Navigation
" --

" Start scrolling a few lines before borders
set scrolloff=5

" Use h, j, k, l rather than arrow keys
nnoremap <left> :echoe "Use h instead"<cr>
nnoremap <down> :echoe "Use j instead"<cr>
nnoremap <up> :echoe "Use k instead"<cr>
nnoremap <right> :echoe "Use l instead"<cr>

vnoremap <left> :echoe "Use h instead"<cr>
vnoremap <down> :echoe "Use j instead"<cr>
vnoremap <up> :echoe "Use k instead"<cr>
vnoremap <right> :echoe "Use l instead"<cr>

inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

" Navigate window splits quicker
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Move to beginning and end of line easily
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Improve movement on wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$

vnoremap j gj
vnoremap k gk
vnoremap 0 g0
vnoremap ^ g^
vnoremap $ g$

" Center viewport while scrolling
nnoremap G Gzz
nnoremap } }zz
nnoremap { {zz

" --
" Tabs, Spaces, and Indentation
" --

" Enable file type detection and language-based indenting
filetype plugin indent on

" Enable smart tabs
set smarttab

" Specify the width of a tab
set tabstop=2

" Use spaces instead of tabs
set expandtab

" Set the number of spaces per tab
set softtabstop=2

" Set the amount of spaces when indenting
set shiftwidth=2

" Round indent to a multiple of shiftwidth
set shiftround

" Auto-indent new lines
set autoindent

" Enable smart indentantion
set smartindent

" Indent wrapped lines to match indentation
set breakindent

" Do not insert two spaces after punctuation on joining
set nojoinspaces

" Indent and de-indent using tab
nnoremap <tab> >>
nnoremap <s-tab> <<

" Trim leading and trailing white spaces from current line
map <leader>lw :%s/^\s\+//e<cr>
map <leader>tw :%s/\s\+$//e<cr>

" --
" Search
" --

" Highlight all search results
set hlsearch

" Make search case sensitive if pattern contains an uppercased letter
set smartcase

" Enable case-insensitive search
set ignorecase

" Enable incremental search
set incsearch

" Center viewport while searching
nnoremap n nzz
nnoremap N Nzz

" Turn off search highlighting
nnoremap <c-n> :nohlsearch<cr>

" --
" Commands
" --

" Edit, save, and quit by using more lenient bindings
command! -bang -nargs=? -complete=file E e<bang> <args>
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang Qa qa<bang>
command! -bang QA qa<bang>

" --
" Text Editing
" --

" Yank from cursor to the end of line
nnoremap Y y$

" Use U to redo which pairs nicely with the undo
nnoremap U <c-r>

" Upper and lowercase current word
nmap <leader>uc gUiW
nmap <leader>lc guiW

" Select all text
nmap <leader>a ggVG

" --
" Other
" --

" Make dot command work in visual mode
vnoremap . :normal .<cr>

" Edit and reload ~/.vimrc
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>rv :source $MYVIMRC<cr>:echo ' ~/.vimrc reloaded'<cr>

" Reload ~/.vimrc automatically upon save
augroup vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source % | echo ' ~/.vimrc reloaded' | redraw
augroup end