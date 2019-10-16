;Ignore this section
#NoEnv
 
;Removes the AHK icon from your taskbar, just remove these two lines if you really want the icon
;#NoTrayIcon
 
#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2


; Resizes the client to whatever resolution you wish // Ctrl+F12
^F12::ResizeWin(1920,1080)
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

; Resizes the client to whatever resolution you wish // Ctrl+F11
^F11::ResizeWin(1376,768)
;   change this ^^^^^^^^^^^^
ResizeWin2(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width2% = 0
    Width := W
  If %Height2% = 0
    Height := H
  WinMove,A,,%X%,%Y%,%Width2%,%Height2%
}
