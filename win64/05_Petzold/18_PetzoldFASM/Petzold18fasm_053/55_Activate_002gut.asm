wmRectActivate: ;Set the appropriate menu
;if(lParam ==(LPARAM) hwnd)
    ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuRect,(LPARAM) hMenuRectWindow);
;else
    ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuInit,(LPARAM) hMenuInitWindow);
    ;DrawMenuBar(hwndFrame);
;return 0    ;

cmp r9, rcx
    jne notRect

;Rect:
    invoke SendMessage, [hwndClientR], WM_MDISETMENU, [hMenuRect], [hMenuRectWindow]
    jmp @f

notRect:
    invoke SendMessage, [hwndClientR], WM_MDISETMENU, [hMenuInit], [hMenuInitWindow]

@@:
    invoke DrawMenuBar, [hwndFrameR]
    xor rax, rax
    jmp endRectWndProc

