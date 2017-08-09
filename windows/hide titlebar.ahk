#singleinstance force


;-Caption
LWIN & LButton::
WinSet, Style, -0xC00000, A
return
;

;+Caption
LWIN & RButton::
WinSet, Style, +0xC00000, A
return
;

; Resizes the client to whatever resolution you wish // Ctrl+F12
^F12::ResizeWin(1366,768)
;   change this ^^^^^^^^^^^^
ResizeWin(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width% = 0
    Width := W
  If %Height% = 0
    Height := H
  WinMove,A,,%X%,%Y%,%Width%,%Height%
}