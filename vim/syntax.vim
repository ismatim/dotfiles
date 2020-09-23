
"======= General File Types ======"
" when is compiled with autocommands.
if has("autocmd")
    " Setup indentation
    autocmd FileType pug setlocal ts=2 sts=2 sw=2 expandtab
    "autocmd FileType *.ts setlocal ts=2 sts=0 sw=2 expandtab
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
    "autocmd BufRead,BufNewFile .jsx set filetype=javascript.jsx
    autocmd BufRead,BufNewFile .*rc set filetype=json
    autocmd BufRead,BufNewFile .mongorc set filetype=javascript
endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"===== HTML ======"
augroup filetype_html
    autocmd!
    autocmd BufWritePre, BufRead *.html :normal gg=G
    autocmd BufNewFile, BufRead *.html setlocal nowrap
    autocmd FileType *.html nnoremap <buffer> <localleader>c I<!--<esc>$a--><esc>
augroup END

"===== EJS ======"
augroup filetype_ejs
    autocmd!
    au BufNewFile,BufRead *.ejs set filetype=html
    au FileType ejs setlocal ts=2 sts=2 sw=2 expandtab
augroup END

"===== Javascript ===== "
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 shiftwidth=2 expandtab
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ( ){}else{}<left>
    autocmd FileType javascript :iabbrev <buffer> forr for (var i =0;;){<cr>/*code here*/<cr>};<left>
    autocmd FileType javascript :iabbrev <buffer> rtn return;
    autocmd FileType javascript :iabbrev <buffer> funn function(){<cr>}
    autocmd FileType javascript :iabbrev <buffer> arrow (e)=>{}<left>
    autocmd FileType javascript :iabbrev <buffer> imp import * from *;<left>
    autocmd FileType javascript :iabbrev <buffer> cnt const  =<left><left>  
    autocmd FileType javascript :iabbrev <buffer> cns console.log(' ')<left><left>
    autocmd FileType javascript :iabbrev <buffer> cnsj console.log(' ' + JSON.stringify())<left><left>

augroup END


"===== SCSS ======"
augroup filetype_scss
   autocmd!
   autocmd FileType *.scss setlocal ts=2 sts=0 sw=2 expandtab
augroup END


"===== CSS ===== "
augroup filetype_css
    autocmd!
    autocmd FileType *.css nnoremap <buffer> <localleader>c I//<esc>
augroup END

"===== C# ===== "
augroup filetype_cs
    autocmd!
    autocmd FileType *.cs nnoremap <buffer> <localleader>c I//<esc>
augroup END
"===== C++==== "
augroup filetype_cpp
    autocmd!
    autocmd FileType *.cpp nnoremap <F9> gg=G``a
    autocmd FileType *.cpp inoremap <F9> <ESC>gg=G``a
    autocmd FileType *.cpp set equalprg=clang-format
    autocmd FileType *.cpp set autoindent
    autocmd FileType *.cpp set cindent
augroup END
"===== C ==== "
augroup filetype_cpp
    autocmd!
    autocmd FileType *.c nnoremap <F9> gg=G``a
    autocmd FileType *.c inoremap <F9> <ESC>gg=G``a
    autocmd FileType *.c set equalprg=clang-format
    autocmd FileType *.c set autoindent
    autocmd FileType *.c set cindent
augroup END



"===== Vim ===== "
augroup name_group
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim :iabbrev <buffer> augg augroup name_group<cr>autocmd!<cr>augroup END
augroup END

"======= JSX ===== "
"augroup FiletypeGroup
    "autocmd!
    "au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
"augroup END

"====== Bash ======"

