if exists('g:GuiLoaded')
    " call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    GuiFont! Fira\ Code:h13
    " GuiFont! Cascadia\ Code:h13:l

    vmap <C-c> y
    imap <C-v> <C-r><C-o>*
    cmap <C-v> <C-r><C-o>* 
    " ctrl-v to paste in fzf prompt
    tnoremap <expr> <C-v> '<C-\><C-N>pi'

    set mouse=a
    " nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    " inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
    " vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    " let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
endif
