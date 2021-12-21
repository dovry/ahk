#NoEnv
#SingleInstance, force
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, %A_WorkingDir%\icons\resize.png ,, 1 ; icon

#installKeybdHook
TrayTip, %A_ScriptName%, Started, 1
;SoundBeep, 250, 250
;^#!r::reload %A_ScriptName% ; reload the script


^F8:: ; Get window stats to create more presets below
WinGetActiveStats, winT, winW, winH, winX, winY
WinGetClass, class, A
MsgBox, 
(
- TITLE
%winT%

- CLASS
%class%

- COORDINATES (top left corner)
X %winX% , Y %winY%

- DIMENSIONS
%winW%  x  %winH%
)
return

^F12::ResizeWin(1920,1080) ; Ctrl+F12
^+F12::ResizeWin(2280,1394) ; Shift+Ctrl+F12 ; 2/3rds of ultrawide
^F11::ResizeWin(1376,768) ; Ctrl+F11
^F10::ResizeWin(955,719) ; Ctrl+F10
^F9::ResizeWin(843,640) ; Ctrl+F9
^+F9::ResizeWin(1160,693) ;Shift+Ctrl+F9

^!Lbutton:: ; ctrl+alt+Lbutton to toggle always on top
WinGet, currentWindow, ID, A
WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
{
   Winset, AlwaysOnTop, off, ahk_id %currentWindow%
}
else
{
   WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
}
return

ResizeWin(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width% = 0
    Width := W
  If %Height% = 0
    Height := H
  WinMove,A,,%X%,%Y%,%Width%,%Height%
}

;-----------------------------
;Collapse titlebar
LWIN & LButton::
WinSet, Style, -0xC00000, A
return

;Uncollapse titlebar
LWIN & RButton::
WinSet, Style, +0xC00000, A
return
;-----------------------------


Gui, +ToolWindow +AlwaysOnTop -SysMenu -Caption +Border
Gui, Color, cCCCCCC
SetTimer, Draw, 100 

Draw:
MouseGetPos, MouseX, MouseY, MouseWin ; get mouse coords/window
WinActivate, %MouseWin%

WinGetActiveStats, Title, WinW, WinH, WinX, WinY ; get the stats of the active window

; variables
DrawW := (WinW)
DrawH := (WinH)
DrawX := (WinX - 1)
DrawY := (WinY - 1) 

; show the gui
Gui, Show, NoActivate w%DrawW% h%DrawH% x%DrawX% y%DrawY%, Draw
WinSet, TransColor, CCCCCC, Draw
return
