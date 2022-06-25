" fix paste issues in ipython
let g:slime_python_ipython = 1

"" for tmux
" 1. vsplit tmux pane
" 2. nvim foo.py (on left pane. start with '##' to specify each cell)
" 3. :SlimeSend1 ipython --matplotlib  "will launch ipython on right pane"
" 4. :IPythonCellExecuteCellJump       "execute cell"
" 5. :SlimeSend1 exit                  "to shutdown ipython"
let g:slime_target = 'tmux'
" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
"" for tmux end

"" for neovim terminal
" :call IPythonOpen() to open ipython on neovim terminal
let g:slime_target = 'neovim'
let g:slime_dont_ask_default = 1

function! IPythonOpen()
    " open a new terminal in vertical split and run IPython
    vnew|call termopen('ipython --matplotlib')
    file ipython " name the new buffer

    " set slime target to new terminal
    if !exists('g:slime_default_config')
        let g:slime_default_config = {}
    end
    let g:slime_default_config['jobid'] = b:terminal_job_id

    wincmd p " switch to the previous buffer
endfunction
"" for neovim terminal end
