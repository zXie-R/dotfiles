if exists('g:GuiLoaded')
    " call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    GuiFont! Cascadia\ Code:h14:l

    vmap <C-c> y
    imap <C-v> <C-r><C-o>*
    cmap <C-v> <C-r><C-o>*
     
endif
