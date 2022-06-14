let g:startify_session_dir = '~/.config/nvim/session'
" Similar to Vim-rooter
let g:startify_change_to_vcs_root = 1
" If you want Unicode
let g:startify_fortune_use_unicode = 1

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['♻  最近使ったファイル:']            },
          \ { 'type': 'dir',       'header': ['♲  最近使ったファイル(カレントディレクトリ下):'. getcwd()] },
          \ { 'type': 'sessions',  'header': ['⚑  セッション:']       },
          \ { 'type': 'bookmarks', 'header': ['☺  ブックマーク:']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'n': '~/.config/nvim/init.vim' },
            \ { 'p': '~/.config/nvim/vim-plug/plugins.vim' },
            \ { 'z': '~/.zshrc.funa' },
            \ '~/git',
            \ '~/.config/nvim',
            \ '~/.config/nvim/plug-config',
            \ '~/symbio/Hack',
            \ ]

" ASCII ARTを真ん中寄せする
" :h startifyを参照
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
        \ '   _  __     _     ',
        \ '  / |/ /  __(_)_ _ ',
        \ ' /    / |/ / /  ` \',
        \ '/_/|_/|___/_/_/_/_/',
        \])
