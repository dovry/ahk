#NoEnv
#SingleInstance, force
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%

; icon
Menu, Tray, Icon, %A_WorkingDir%\icons\resize.png ,, 1

; Get window stats, useful if you're going to be creating more presets below
^F8::
WinGetActiveStats, winT, winW, winH, winX, winY
WinGetClass, class, A
MsgBox, % "Title is:`n" winT "`n`nClass is:`n" class "`n`nCoords start at:`nx" winX ", y" winY "`n`nWidth x Height:`n" winW " x " winH
return

; Ctrl+F12
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

; Ctrl+F11
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

; Ctrl+F10
^F10::ResizeWin(955,719)
;   change this ^^^^^^^^^^^^
ResizeWin3(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width3% = 0
    Width := W
  If %Height3% = 0
    Height := H
  WinMove,A,,%X%,%Y%,%Width3%,%Height3%
}

; Ctrl+F10
^F9::ResizeWin(843,640)
;   change this ^^^^^^^^^^^^
ResizeWin4(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width4% = 0
    Width := W
  If %Height4% = 0
    Height := H
  WinMove,A,,%X%,%Y%,%Width4%,%Height4%
}