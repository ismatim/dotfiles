set nocompatible

call plug#begin('$HOME/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'" help fugitive
Plug 'tpope/vim-rhubarb'

" INTEGRATION TOOLS

augroup LastPositionJump
  autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale', {'for': ['python', 'sql', 'vim', 'bash', 'sh', 'javascript' ]}
  let g:ale_lint_on_text_changed='normal'
Plug 'Chiel92/vim-autoformat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'mattn/emmet-vim' " Expand html tags
Plug 'patstockwell/vim-monokai-tasty' "javascript
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'ludovicchabant/vim-gutentags', {'for': ['python', 'sql' ]}
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


call plug#end()

"==================================="
"======== PLUGINS MAPPING =========="
"==================================="
"============ vim-gutentags ========"
" vim-gtfo "
let g:gtfo#terminals = { 'mac': 'iterm' }

let g:gutentags_modules=['ctags', 'gtags_cscope']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json' ]
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
let g:gutentags_ctags_exclude = [
      \ '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ '.cache',
      \ 'cache',
      \ 'docs',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.zip',
      \ 'tags*',
      \ '*.min.js',
      \ '*.min.css',
      \ '__pycache__',
      \ ]

let g:gutentags_exclude_filetypes = [ '*.md', '*.mdx']
"let g:gutentags_trace= 1

"=========== vim-fugitive ========"
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
"=========== Deoplete ========"
let g:deoplete#enable_at_startup = 1
"
"=========== Utils Snippet ========"
" Examples of use: insert mode: rfc<c-l>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"" disable preview window
"set completeopt-=preview
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>up :vsplit ~/.vim/plugged/vim-snippets/snippets/python.snippets<cr>

"====== Color Monokai======= "
"let macvim_skip_colorscheme=1
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty  "javascript
"================ ACK =============="

map <leader>a :Ack! ""<Left>
if executable('ag')
    let g:ackprg ='ag --ignore yarn.lock --ignore node_modules --vimgrep '
endif

"================ FZF =============="
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~45%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(bold)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=.git'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'



"====== Airline Plugin ========="
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
"===== typewriter theme ==== "

"========= Autoformat ========="
"au BufWrite * :Autoformat

"=========  ALE Plugin  ======="
"switch location list to quicklist view
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let g:ale_list_window_size = 5
"" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"run linters only when I saved
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_save = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
let g:ale_linters = {
            \ 'jsx': ['eslint'],
            \ 'javascript': ['eslint'],
            \ 'python': ['mypy', 'flake8']
            \}

"let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

"let errorformat =
        "\ '%f:%l:%c: %trror: %m,' .
        "\ '%f:%l:%c: %tarning: %m,' .
        "\ '%f:%l:%c: %tote: %m'
""
"-------JAVA ECLIMD-------"
"autocmd FileType java map <buffer> <leader>ff :%JavaFormat<CR>
"autocmd FileType java map <buffer> <leader>ff :%JavaFormat<CR>

"----------plugin/vim-javacomplete2--------"
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

"==========Emmet VIM==============="

"Current Key is <Ctrl> + Y
"Example: Ctrl + y ,
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
            \      'extends' : 'jsx'
            \  },
            \}



"highlight clear

"highlight CursorColumn ctermfg=NONE    ctermbg=236  cterm=NONE
"highlight CursorLine   ctermfg=NONE    ctermbg=236  cterm=NONE
"highlight CursorLineNr ctermfg=7       ctermbg=236  cterm=NONE
"highlight DiffAdd      ctermfg=2       ctermbg=NONE cterm=NONE
"highlight DiffChange   ctermfg=2       ctermbg=NONE cterm=NONE
"highlight DiffDelete   ctermfg=1       ctermbg=NONE cterm=NONE
"highlight DiffText     ctermfg=2       ctermbg=236  cterm=NONE
"highlight FoldColumn   ctermfg=248     ctermbg=NONE cterm=italic
"highlight Folded       ctermfg=248     ctermbg=NONE cterm=italic
"highlight LineNr       ctermfg=238     ctermbg=NONE cterm=NONE
"highlight MatchParen   cterm=underline ctermbg=NONE cterm=NONE
"highlight NonText      ctermfg=236     ctermbg=NONE cterm=NONE
"highlight Normal       ctermfg=NONE    ctermbg=NONE cterm=NONE
"highlight Pmenu        ctermfg=15      ctermbg=236  cterm=NONE
"highlight PmenuSbar    ctermfg=7       ctermbg=NONE cterm=NONE
"highlight PmenuSel     ctermfg=236     ctermbg=2    cterm=NONE
"highlight PmenuThumb   ctermfg=7       ctermbg=NONE cterm=NONE
"highlight SignColumn   ctermfg=NONE    ctermbg=NONE cterm=NONE
"highlight SpellBad     ctermfg=NONE    ctermbg=NONE cterm=underline
"highlight SpellCap     ctermfg=NONE    ctermbg=NONE cterm=underline
"highlight Error        ctermfg=1       ctermbg=NONE cterm=underline
"highlight StatusLine   ctermfg=15      ctermbg=236  cterm=bold
"highlight StatusLineNC ctermfg=245     ctermbg=0    cterm=NONE
"highlight VertSplit    ctermfg=236     ctermbg=236  cterm=NONE
"highlight Visual       ctermfg=NONE    ctermbg=238  cterm=NONE
"highlight WildMenu     ctermfg=236     ctermbg=2    cterm=NONE
"highlight qfFileName   ctermfg=245     ctermbg=NONE cterm=italic
"highlight qfLineNr     ctermfg=238     ctermbg=NONE cterm=NONE
"highlight qfSeparator  ctermfg=0       ctermbg=NONE cterm=NONE

"highlight Comment        ctermfg=248 ctermbg=NONE cterm=NONE
"highlight String         ctermfg=10  ctermbg=NONE cterm=NONE
"highlight htmlH1         ctermfg=15  ctermbg=NONE cterm=bold
"highlight htmlItalic     ctermfg=7   ctermbg=NONE cterm=italic
"highlight htmlItalicBold ctermfg=15  ctermbg=NONE cterm=italic
"highlight htmlBoldItalic ctermfg=15  ctermbg=NONE cterm=bold



