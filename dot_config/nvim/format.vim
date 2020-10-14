if !exists('g:formatdef_dfmt')
    let s:configfile_def = '"dfmt"'
    let s:noconfigfile_def = '"dfmt -t " . (&expandtab ? "space" : "tab") . " --indent_size " . shiftwidth() . (&textwidth ? " --soft_max_line_length " . &textwidth : "")'
    let g:formatdef_dfmt = 'g:EditorconfigFileExists() ? (' . s:configfile_def . ') : (' . s:noconfigfile_def . ')'
    let g:formatters_d = ['dfmt']
endif

function! g:EditorconfigFileExists()
    return len(findfile(".editorconfig", expand("%:p:h").";"))
endfunction
