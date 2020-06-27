"=================================================================
"= Copyright 2016 Ismael Jonas Tisminetzky, all rights reserved. =
"= ismatim@gmail.com                                             =
"=================================================================

"Unmap the arrow keys - for education purpose.
"no <Down> <Nop>
"no <Left> <Nop>
"no <Right> <Nop>
"no <Up> <Nop>
"ino <Down> <Nop>
"ino <Left> <Nop>
"ino <Right> <Nop>
"ino <Up> <Nop>

" Useful mappings:  Map <C-L> (redraw screen)
" to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

"========= Leader ============"

let mapleader = "¡"
"can be custom for specific file type i.e javascript, python, etc.
let maplocalleader = "¡"

"============================="
"========= Functions ========="
"============================="

" StripTrailingWhiteSpaces
source ~/startup/vim/functions/striptrailingspaces.vim
" Go To Jump
source ~/startup/vim/functions/gojump.vim

"========== Folding ========="

set foldlevelstart=0
nnoremap <Space> za
vnoremap <Space> za

"========== Clipboard ======="
set clipboard=unnamed
" Copy to 'clipboard registry'
vmap <C-c> "*y
" Select all text
nmap <C-a> ggVG

"======== Utilities ========="
inoremap jk <esc>
nnoremap <leader>- ddp
" move the line up but, not work for last line.
nnoremap <leader>_  ddkP
inoremap <leader><c-d> <esc>ddi
inoremap <leader><c-u> <esc>gUiw " convert all the word in uppercase.
nnoremap <leader><c-u> gUiw
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' `><esc>a'<esc>hvwi`><esc>i'<esc>lel
vnoremap <leader>" `><esc>a"<esc>hvwi`><esc>i"<esc>lel
nnoremap <leader>"" 0i"<esc>$a"<esc>
nnoremap <leader>'' 0i'<esc>$a'<esc>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>w :w<cr>
"vnoremap <leader>c "+y
noremap <leader>rt :+tabmove<CR>
noremap <leader>rT :-tabmove<CR>

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
"" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<cr>
"
"============ Git Gutter===================="
"And you can turn line highlighting on and off (defaults to off):
nmap <silent> <leader>guh :GitGutterLineHighlightsToggle<cr>
"turn line number highlighting on and off
nmap <silent> <leader>gul :GitGutterLineNrHighlightsToggle<cr>
"move through hunks
nmap gus <Plug>(GitGutterStageHunk)
nmap guu <Plug>(GitGutterUndoHunk)

"============ Fugitive ===================="

nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gc :Gcommit<cr>
nmap <silent> <leader>gw :Gwrite<cr>
nmap <silent> <leader>gd :Gvdiff<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gb :Gblame<cr>
nmap <silent><leader>gwp :wq<Bar>Gpush<Bar>q<cr>
"============ NERDTree ===================="

noremap <leader>nt :NERDTreeToggle<CR>
inoremap <leader>nt <esc>:NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
inoremap <leader>nf <esc>:NERDTreeFind<CR>
noremap <leader>no :NERDTree<CR>:OpenBookmark<space>
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

"============ FZF Plugin ============"

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
vnoremap <leader>rg <ESC>:Rg!
nnoremap <leader>rg :Rg!<CR>
nnoremap <leader>gl :Git! log -p -- %<CR>

"show buffers
vnoremap <leader>sb :Buffers!
"Show preview of files
nnoremap <leader>sp :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))

"============ Buffers Handlers ============"

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :Buffers<CR>
nnoremap <Leader>b :Lines<CR>
nnoremap <Leader>f :bn<CR>

"========ShortCut to Files========="
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit ~/startup/vim/general.vim<cr>
nnoremap <leader>em :vsplit ~/startup/vim/mapping.vim<cr>
nnoremap <leader>es :vsplit ~/startup/vim/syntax.vim<cr>
nnoremap <leader>ep :vsplit ~/startup/vim/plugins.vim<cr>

"---Vim Diff Configuration---"
nnoremap <leader>ed :vsplit ~/startup/vim/vimdiff.vim<cr>
"======= Code Files ======="

"nnoremap <leader>evim :vsplit ~/UNIT_DATA/tools/code/vim/vim.01.md<cr>

"short cut for paste without indent
set pastetoggle=<F5>
"when highlighting is lost, hit it this.
nnoremap <F4> :syntax sync fromstart<CR>
"======== General Abbreviation ========="
"iabbrev @isma ismatim@gmail.com
iabbrev ccopy Copyright 2020 Ismael Jonas Tisminetzky, all rights reserved.

"=================================================="
"===== Operator-Pending Mappings (operators) ======"
"=================================================="

"select all inside the parenthesis. Need to be inside.
onoremap p i(
"inside double quotes
onoremap c i"

"select all until return
onoremap b /return<cr>
"select all inside parenthesis more near forward. Should be in the same line.
onoremap in( :<c-u>normal! f(vi(<cr>
"select all inside parenthesis more near backward. Should be in the same line.
onoremap il( :<c-u>normal! F)vi(<cr>
"standing inside a paragraph in a markdown file, it deletes its headline. The
"headline must be underlined with ==
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
noremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
"
"
"=======Grep========"
"noremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>g :Grepper -tool git -noopen -jump<cr>
"TODO: For look in the current buffer: Grepper -buffer -query word-to-search
"TODO: For look loaded files: Grepper  -query word-to-search
"start searching the word under the cursor.
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
"=======Vue========="
"nnoremap <leader>pvu :%!vue-formatter<CR>
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css


"=======ALE LINT========="
nnoremap <leader>l :ALEFix<cr>
inoremap <leader>l :execute "normal! :ALEFix"<cr>
vnoremap <leader>l <ESC>:ALEFix<cr>

"for the list location navigation:
nnoremap <space>l :lnext<CR>
nnoremap <space>p :lprevious<CR>
nnoremap <space>r :lrewind<CR>

"TODO: find best way to show erros through erroformat in location list.
" check: https://github.com/jonsmithers/dotfiles/blob/master/vim/vimrc

"======= Open Session====" 
nnoremap <leader>so :OpenSession!<Space>
nnoremap <leader>ss :SaveSession!<Space>

"======= Prettier ======="
nmap <Leader>p <Plug>(PrettierAsync)

"======= coc.nvim ======="

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer".
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
