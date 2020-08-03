" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
set history=1000
set undofile
set undoreload=10000
set autoindent
set ttyfast
" set hidden set wildmenu
" Show partial commands in the last line of the screen
set showcmd
set hidden
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
set mouse=a
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
set laststatus=2
set confirm
set visualbell
set cmdheight=2
set number
set rnu "relative number from current line.
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"=======Characters Visualization======="
set encoding=utf-8
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:•,nbsp:•
set ts=4 sts=4 sw=4 expandtab
let g:indentLine_color_term=239
set fillchars=diff:⣿,vert:│
set wrap

"====Special for gVim====="
if has("gui_running")
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:•,nbsp:•
"    set guifont=Consolas:h16
    set macligatures
    set guifont=Fira\ Code:h12
endif
"=========Wild Completition===="
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

"=======Backup======"
set nobackup                       " enable backups
set noswapfile

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

"========Folding======"
set foldmethod=indent
set foldnestmax=10
set nofoldenable

"==== vimdiff === "

"=========Color Scheme========="
"colorscheme tender "gVim
"set background=dark
let g:solarized_diffmode="high"

"=====NeoVim===="
"language en_US
