"----------------------------------------------------------
" Start of CHI LUONG customization
"----------------------------------------------------------
" Make Vim more useful
set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "scrooloose/snipmate-snippets"
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjl/gundo.vim'
Bundle 'briancollins/vim-jst'
Bundle 'wavded/vim-stylus'
Bundle 'gregsexton/MatchTag'
Bundle 'xuhdev/vim-latex-live-preview'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'edkolev/promptline.vim'

filetype plugin indent off

" The default updatetime of 4 seconds is too slow
set updatetime=1000

" Set tab options
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
  au BufWritePost .vimrc so ~/.vimrc
  au BufWritePost .vimrc.local so ~/.vimrc
augroup END

"======================================================================="
" Key maps
"======================================================================="

set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=1000

" Configure the use of the Alt key to access menus.
"   no - never use Alt key for menus; all Alt-key combinations are mappable.
"   yes - always use Alt key for menus; cannot map Alt-key combinations.
"   menu - Alt-key combinations not used by menus are mappable.
set winaltkeys=menu

" Set Alt mapping for most keys
let c='A'
while c <= '~'
  " these keys can't be mapped properly without side effects
  if c != '>' && c != '|' && c != '[' && c != 'O'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
  endif
  let c = nr2char(1+char2nr(c))
endw

" Remap leader to comma
let mapleader = ","

" Use Perl regex by default
nnoremap / /\v
vnoremap / /\v

"Write changes to protected read-only files.
cmap w!! %!sudo tee > /dev/null %

" Make Y copy from cursor to EOL
map Y y$

" Make Q break line to textwidth
map Q gq

" Make + (Shift=) format the whole file
nmap + gg=G

" Movement maps
" nnoremap ; :
" nnoremap : ;
noremap j gj
noremap k gk
" nnoremap $ g$
" nnoremap ^ g^

" Reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Manage tabs
" map tt :tabedit<Space>
" map tm :tabmove<Space>
" map tf :tabfind<Space>
" map tn :tabnew<CR>
" map th :tabprev<CR>
" map tl :tabnext<CR>
" map tj :tabfirst<CR>
" map tk :tablast<CR>
" map tc :tabclose<CR>
" Map t<i> to tab ith
" for i in range(1,9)
"   exec 'map t'.i.' '.i.'gt'
" endfor


" Keep search term at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Toggle Highlight Search
nnoremap <silent> <Space> :set hlsearch! hlsearch?<CR>
nnoremap <silent> <C-e> :call ToggleList("Quickfix List", 'copen', 'cclose')<CR>
" nnoremap <silent> <C-S-L> :call ToggleList("Location List", 'l')<CR>
" cmap <silent> <C-c> q

nnoremap <silent> <leader><Space> :RainbowParenthesesToggle<CR>

" Manage buffers
nnoremap <C-k> :bn<CR>
nnoremap <C-j> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

" Manage Tabs
" map <C-l> :tabnext<CR>
" map <C-h> :tabprev<CR>

" Circle quick fix
map <A-h> :cp<CR>
map <A-l> :cn<CR>

" Manage windows
map <C-\> :vs<CR>
" nmap <silent> <Up> :wincmd k<CR>
" nmap <silent> <Down> :wincmd j<CR>
" nmap <silent> <Left> :wincmd h<CR>
" nmap <silent> <Right> :wincmd l<CR>
nmap <silent> <A-Up> :wincmd -<CR>
nmap <silent> <A-Down> :wincmd +<CR>
nmap <silent> <A-Left> :wincmd <<CR>
nmap <silent> <A-Right> :wincmd ><CR>

" Replace the current word with the most recent yank
vnoremap <A-p> d"0P
nnoremap <A-p> diw"0P

" Drag current lines
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

" Easymotion shortcuts
nmap <C-w> <leader><leader>w
nmap <C-b> <leader><leader>b
nmap <C-a> <leader><leader>f
"nmap <C-e> <leader><leader>e

" Easy find/subtitute
nnoremap <A-r> :%s/\<<C-r><C-w>\>/

" TComment keys
nmap <A-q> :TComment<CR>
nmap <A-c> :TCommentBlock<CR>

nnoremap <silent> <A-o> o<Esc><Esc>

" Grep
map <A-f> :Ack<CR>
map <A-F> :Ack 
" map <A-f> :call GlobalGrep(expand("<cword>"))<CR>
" map <A-F> :call GlobalGrepPrompt()<CR>

" Find the current word in the same file
map <A-n> *
map <A-N> #

" CTags
map <A-]> :vs <CR>:exec("tag ".expand("<cword>"))<CR>

" Nerdtree toogle
nmap <F2> :NERDTreeToggle<CR>

" TagBar toggle
nmap <F4> :TagbarToggle<CR>

" Run the current file (remember to chmod +x it first)
nmap <F5> :call ExecuteCurrentFile()<CR>

" Gundo toggle
nmap <F6> :GundoToggle<CR>

" Run current file, output both to stdout and a temp file. Open that temp file
" after execution in a split
function! ExecuteCurrentFile()
  write
  let outfile = system('mktemp')
  silent! execute '!stdbuf -o 0 %:p 2>&1 | tee ' . outfile
  execute 'split ' . outfile
  redraw!
endfunction

" Make 0 move back and forth between BOL and first word in line
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Char-48> SmartHome()

" Make F7 remove trailing white space
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
nmap <F7> :call StripTrailingWhitespace()<CR>

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, cmdopen, cmdclose)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:cmdclose)
      return
    endif
  endfor
  if a:cmdopen == 'lopen' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:cmdopen)
  if winnr() != winnr
    wincmd p
  endif
endfunction

function! GlobalGrepPrompt()
  " prompt for string
  echohl Question
  call inputsave()
  let inp = input('Enter string to grep:')
  call inputrestore()
  echohl None

  call GlobalGrep(inp)
endfunction

function! GlobalGrep(inp)
  " Check that we have an input
  if empty(a:inp)
    redraw!
    return
  endif

  silent! execute "grep -srnw --binary-files=without-match --exclude=*tags --exclude-dir=.git . -e " . a:inp . " " | cwindow
  redraw!
  echo a:inp
endfunction

"======================================================================="
" Other settings
"======================================================================="
" TagBar settings
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▷', '◢']
let g:tagbar_autoshowtag = 1

" Enable persistent undo
if exists("+undofile")
  set udf
  set undodir=~/.vimundo
endif
" CtrlP settings
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.DS_Store'
      \ }

" Syntastic settings
let g:syntastic_check_on_open=0 " check on first load
"let g:syntastic_error_symbol='✗'
let g:syntastic_error_symbol='»'
let g:syntastic_stl_format = ' %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} '
"let g:syntastic_warning_symbol='⚠'
let g:syntastic_warning_symbol='»'

" EasyMotion settings
let g:EasyMotion_keys = 'jkl;asdfiowerutyqpzxcvm,./bn238901'
" let g:EasyMotion_leader_key = '<Leader>'
"hi link EasyMotionTarget User1

" YouCompleteMe settings
let g:ycm_allow_changing_updatetime = 0
let g:ycm_min_num_of_chars_for_completion = 1

" Set ackvim to highlight results
let g:ackhighlight = 1

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" Promptline settings
let g:promptline_theme = 'powerlineclone'
let g:promptline_preset = {
        \'a'    : [ '\t'],
        \'c'    : [ '\u@\h' ],
        \'b'    : [ promptline#slices#vcs_branch() ],
        \'x'    : [ promptline#slices#cwd({ 'dir_limit': 7}) ],
        \'warn' : [ promptline#slices#jobs(), promptline#slices#last_exit_code() ]}

" Highlight Selection
hi Visual cterm=bold

"----------------------------------------------------------
" End of CHI LUONG customization
"----------------------------------------------------------

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
" Use 12pt Menlo
set guifont=Menlo:h12

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
