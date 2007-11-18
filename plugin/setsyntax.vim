" setsyntax.vim -- Syntax-specific options
" @Author:      Thomas Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-11-18.
" @Last Change: 2007-11-18.
" @Revision:    0.2.20
" GetLatestVimScripts: 2076 0 setsyntax.vim

if &cp || exists("loaded_setsyntax")
    finish
endif
if !exists('g:loaded_hookcursormoved') || g:loaded_hookcursormoved < 5
    echoerr 'hookcursormoved >= 0.5 is required'
    finish
endif
let loaded_setsyntax = 1

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:setsyntax_options')
    " This variable is a dictionary of dictionaries of dictionaries.
    " {FILETYPE => {SYNREGEXP => {OPTION/VARIABLE: VALUE}}}
    "
    " Example: >
    "   let g:setsyntax_options['tex'] = {'^texMathZone': {'&l:tw': 4000}}
    let g:setsyntax_options = {}   "{{{2
    let g:setsyntax_options['tex'] = {'^texMathZone': {'&l:tw': 0}}
    let g:setsyntax_options['viki'] = {'^texmath': {'&l:tw': 0}}
endif

augroup SetSyntax
    autocmd!
    for s:filetype in keys(g:setsyntax_options)
        exec 'au Filetype '. s:filetype .' call hookcursormoved#Register("syntaxchange", "setsyntax#Set")'
    endfor
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo


finish
CHANGES:
0.1
- Initial release

0.2
- Defined viki regions

