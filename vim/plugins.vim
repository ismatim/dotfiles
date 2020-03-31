
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
"====Vundle for Vim ===="
set rtp+=~/.vim/bundle/Vundle.vim
"====Vundle for gVim===="
"set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()
if has('nvim')
  Plugin 'shougo/deoplete.nvim' "after install or update, execute: UpdateRemotePlugins
else
  Plugin 'shougo/deoplete.nvim' "after install or update, execute: UpdateRemotePlugins
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'leafgarland/typescript-vim'
Plugin 'w0rp/ale' "Syntax
Plugin 'terryma/vim-multiple-cursors'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'mattn/emmet-vim' " Expand html tags
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive' " help fugitive
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'yuki-ycino/fzf-preview.vim' " NOT WORK IN VIM'
Plugin 'mileszs/ack.vim'
Plugin 'mhinz/vim-grepper'
Plugin 'prettier/vim-prettier'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jparise/vim-graphql'"
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
"=========== git-gutter==========="
"TODO: enable this by default
"TODO: create shortcut
"=========== vim-fugitive ========"
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
"=========== Deoplete ========"
let g:deoplete#enable_at_startup = 1
"set omnifunc=syntaxcomplete#Complete
"=========== Utils Snippet ========"
" Examples of use: insert mode: rfc<c-l>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
""" disable preview window
"set completeopt-=preview

"====== Color Monokai======= "
"let macvim_skip_colorscheme=1
let g:vim_monokai_tasty_italic = 1 
colorscheme vim-monokai-tasty 

"============= Git Gutter =========="

set updatetime=1000

"================ ACK =============="

map <leader>a :Ack! ""<Left>
map <leader>g :Grepper<CR>
if executable('ag')
    let g:ackprg ='ag --ignore yarn.lock --ignore node_modules --vimgrep '
endif
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

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})a

"==== Custom Mappings ===="

nnoremap <leader>s :FZF!
inoremap <leader>s :execute "normal! :FZF!"
vnoremap <leader>s <ESC>:FZF!
"show buffers
vnoremap <leader>sb :Buffers!
"Show preview of files
nnoremap <leader>sp :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))



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
let g:ale_list_window_size = 5
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"run linters only when I saved
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
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

"autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.md Prettier
"

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

