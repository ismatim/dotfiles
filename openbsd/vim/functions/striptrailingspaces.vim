" StripTrailingWhiteSpaces
nnoremap <silent> <F5> :call <SID>StripTrailingSpaces()<CR>

function! <SID>StripTrailingSpaces()
    " Preparation: Save the last position of the cursor.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Set the regex rule and replace.
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
