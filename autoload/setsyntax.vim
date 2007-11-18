" setsyntax.vim
" @Author:      Thomas Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-11-18.
" @Last Change: 2007-11-18.
" @Revision:    0.0.39

if &cp || exists("loaded_setsyntax_autoload")
    finish
endif
let loaded_setsyntax_autoload = 1
let s:save_cpo = &cpo
set cpo&vim


function! setsyntax#Set(mode) "{{{3
    " TLogVAR a:mode
    if exists('b:setsyntax')
        " TLogDBG 1
        for [var, val] in items(b:setsyntax)
            " TLogVAR var, val
            call s:Set(var, val)
            " TLogDBG 2
            unlet var val
        endfor
        " TLogDBG 'unset'
    endif
    let b:setsyntax = {}
    " TLogDBG 3
    for [rx, opts] in items(get(g:setsyntax_options, &filetype, {}))
        " TLogVAR rx
        if b:hookcursormoved_syntax =~ rx
            " TLogVAR opts
            for [var, val] in items(opts)
                call s:SSet(var, val)
                " TLogDBG 4
                unlet var val
            endfor
        endif
        unlet opts
    endfor
endf


function! s:Set(option, value) "{{{3
    " TLogDBG 'let '. a:option .' = '. a:value
    exec 'let '. a:option .' = a:value'
endf


function! s:SSet(option, value) "{{{3
    " TLogDBG 'let b:setsyntax['. string(a:option) .'] = '. string(a:option)
    exec 'let b:setsyntax['. string(a:option) .'] = '. a:option
    call s:Set(a:option, a:value)
endf


let &cpo = s:save_cpo
unlet s:save_cpo
