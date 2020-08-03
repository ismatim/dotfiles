
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
"====Vundle for Vim ===="
set rtp+=~/.vim/bundle/Vundle.vim
"====Vundle for gVim===="
"set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()

"if has('nvim')
  "Plugin 'shougo/deoplete.nvim' "after install or update, execute: UpdateRemotePlugins
"else
  "Plugin 'shougo/deoplete.nvim' "after install or update, execute: UpdateRemotePlugins
  "Plugin 'roxma/nvim-yarp'
  "Plugin 'roxma/vim-hug-neovim-rpc'
"endif
"Plugin 'neoclide/coc.nvim'
Plugin 'gmarik/Vundle.vim'
"Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'neoclide/vim-jsx-improve'
"Plugin 'ludovicchabant/vim-gutentags' 
Plugin 'w0rp/ale' "Syntax
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'mattn/emmet-vim' " Expand html tags
"Plugin 'vim-airline/vim-airline'
""Plugin 'vim-airline/vim-airline-themes'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'godlygeek/tabular'
""Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive' " help fugitive
"Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
""Plugin 'yuki-ycino/fzf-preview.vim' " NOT WORK IN VIM'
Plugin 'mileszs/ack.vim'
Plugin 'mhinz/vim-grepper'
Plugin 'prettier/vim-prettier'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
":wq:Plugin 'SirVer/ultisnips'
"Plugin 'justinmk/vim-gtfo'
Plugin 'Yggdroot/indentLine'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'jparise/vim-graphql'"
"Plugin 'itchyny/lightline.vim'
"Plugin 'logico-dev/typewriter' "from logico
"Plugin 'mhartington/oceanic-next'
"Plugin 'Quramy/tsuquyomi'
"Plugin 'mzlogin/vim-markdown-toc' "Create a table of content
" Java IDE - bit slow, but awesome.
"Plugin 'artur-shaik/vim-javacomplete2'
" All of your Plugins must be added before the following line
"Plugin 'rhysd/vim-clang-format'
call vundle#end()            " required
filetype plugin indent on    " required

" TODO: Move all this mappings to corresponing plugins.name.vim files

"==================================="
"======== PLUGINS MAPPING =========="
"==================================="
"============ vim-gutentags ========"
" vim-gtfo "
"let g:gtfo#terminals = { 'mac': 'iterm' }

"let g:gutentags_modules=['ctags', 'gtags_cscope']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
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
      \ '*.git', '*.svg', '*.hg',
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
      \ ]
"call pathogen#helptags()
set encoding=UTF-8
"============== coc ================"

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
"=========== git-gutter==========="
"TODO: enable this by default
"TODO: create shortcut
"let g:gitgutter_log=1 
"=========== vim-fugitive ========"
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
"=========== Deoplete ========"
"let g:deoplete#enable_at_startup = 1
"set omnifunc=syntaxcomplete#Complete
"
"=========== Utils Snippet ========"
" Examples of use: insert mode: rfc<c-l>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""" disable preview window
"set completeopt-=preview

"====== Color Monokai======= "
"let macvim_skip_colorscheme=1
let g:vim_monokai_tasty_italic = 1 
colorscheme vim-monokai-tasty 

"============= Git Gutter =========="
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
"set updatetime=1000
"================ ACK =============="

map <leader>a :Ack! ""<Left>
if executable('ag')
    let g:ackprg ='ag --ignore yarn.lock --ignore node_modules --vimgrep '
endif
"
"
"=========== vim-grepper ==========="
"
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
let g:fzf_tags_command = 'ctags -R'

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
"let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_linters = {
            \ 'jsx': ['eslint'],
            \ 'javascript': ['eslint']
            \}

"let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --jsx-bracket-same-line true'
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'html': ['prettier'],
            \   'scss': ['prettier'],
            \   'javascript': ['eslint'],
            \   'bash': ['shellcheck']
            \}

let g:ale_echo_msg_format = '%linter%: %s (%code%)'

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


"-------- Prettier VIM -----------"

"let g:prettier#autoformat = 0
" print semicolons
" Prettier default: true
"let g:prettier#config#semi = 'false'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'
"The command :Prettier by default is synchronous but can also be forced async
let g:prettier#exec_cmd_async = 1
"execute Prettier on start
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.md Prettier

"remove autofocus after bug
let g:prettier#quickfix_auto_focus = 0
"-------- LanguageClient-neovim-----"
" Required for operations modifying multiple buffers like rename.
"let g:LanguageClient_devel = 1
"let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
"let g:LanguageClient_loggingLevel = 'INFO'
"let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
"let g:LanguageClient_serverCommands = {
"\ 'typescript': ['javascript-typescript-stdio'],
"\ 'javascript': ['javascript-typescript-stdio'],
"\ 'css': ['css-languageserver', '--stdio'],
"\ 'scss': ['css-languageserver', '--stdio'],
"\ 'less': ['css-languageserver', '--stdio'],
"\ 'json': ['json-languageserver', '--stdio'],
"\ 'html': ['html-languageserver', '--stdio'],
"\ 'Dockerfile': ['docker-langserver', '--stdio']
"\ }

" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F6> :call LanguageClient#textDocument_rename()<CR>
"nnoremap <F7> :call LanguageClient_contextMenu()<CR>

"-------- C / C++ ------"
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

