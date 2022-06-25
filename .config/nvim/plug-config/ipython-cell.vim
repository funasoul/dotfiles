" How to use:
" 1. vsplit tmux pane
" 2. nvim foo.py (on left pane. start with '##' to specify each cell)
" 3. :SlimeSend1 ipython --matplotlib  "will launch ipython on right pane"
" 4. :IPythonCellExecuteCellJump       "execute cell"
" 5. :SlimeSend1 exit                  "to shutdown ipython"

" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
