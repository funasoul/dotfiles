" Change the color
highlight CodiVirtualText guifg=cyan

let g:codi#virtual_text_prefix = "❯ "

" Codi spawns on the right side.
let g:codi#rightsplit = 1

" right-align the Codi buffer.
let g:codi#rightalign = 1

" display interpreter results without formatting each expression to align with the line numbers.
let g:codi#raw = 0

" A dictionary of user-defined interpreter filetype aliases.
let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }
