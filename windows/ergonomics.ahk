#NoEnv
#SingleInstance, force
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%
;#EscapeChar, |
; icon
Menu, Tray, Icon, %A_WorkingDir%\icons\ergonomics.png ,, 1

^#!e::edit %A_ScriptName% ; edit the script
^#!r::reload %A_ScriptName% ; reload the script

; add EXEs that should be ignored
groupadd, ignore, ahk_exe ahk_exe RuneLite.exe
groupadd, ignore, ahk_exe ahk_exe rs2client.exe
groupadd, ignore, ahk_exe ahk_exe Wow.exe

SetTimer CheckWindow, 100
CheckWindow:
If WinActive("ahk_group ignore")
  {
  Suspend , On
  Return
  }
Suspend , Off
Return

;Ctrl+Alt+Shift+Down arrow to get a window's class
!^+Down::
  WinGetClass, class, A
  MsgBox, The active window's class is "%class%".
return

; Ctrl+Alt+Shift+Up arrow to get a window's name
!^+Up::
WinGetTitle, Title, A
MsgBox, The active window is "%Title%".
return

; RShift+LShift to toggle CapsLock
;LShift & RShift::CapsLock
RShift & LShift::CapsLock

; Set Capslock as Ctrl
$CapsLock::Ctrl

; Shift+Ctrl+Alt+R to restart sound driver
!^+R::
RunWait,sc stop "AudioSrv" ;Stop AudioSrv service.
sleep 1
RunWait,sc start "AudioSrv" ;Start AudioSrv service.
return

;Send current date
::..d::
FormatTime, CurrentDate,, dd MMMM yyyy
SendInput %CurrentDate%
return

; Send current Time
::..t::
FormatTime, CurrentDateTime,, HH:mm:ss
SendInput %CurrentDateTime%
return

; alt+hotkey
; y for ()
; u for []
; i for {}
; w for ""
; e for "{{  }}" - Yaml variables
; t for %%
; ' for **
; 3 for `````` - Markdown codeblock
; 4 for ${} - Terraform variables
; Shift+4 for "${}" - Standalone Terraform variables
; Shift+AltGr+4 for "$" - shell vars

!y::send, {(}{)}{Left}
return

!u::send, {[}{]}{Left}
return

!i::send, {{}{}}{Left}
return

!w::send, {" 2}{Left}
return

!e::Send, {"}{{ 2}{space 2}{}}{}}{"}{Left 4}
return

!t::send, {`% 2}{Left}
return

!'::send, {* 2}{Left}
return

!3::send, {` 6}{Left 3}
return

!4::send, ${{}{}}{Left 1}

!+4::send, "${{}{}}"{Left 2}
return

<^>!+4::send, "$"{Left 1}
return

;; Programs

^!p::Run, Powershell.exe
return

^!+p::
Run *RunAs Powershell.exe
return

; Use ctrl+d to exit Powershell window, like other terminals
#If (WinActive("ahk_exe powershell.exe"))
^D::
  Send, {Ctrl Down}c{Ctrl Up} exit {Enter}
 return
#If

; Bring vs code to focus if a window exists, else open
^!c::
IfWinExist, ahk_exe Code.exe
  WinActivate, ahk_exe Code.exe
else
Run Code
return

;Restart explorer.exe
!F2::Process, Close, explorer.exe

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; Ctrl+Alt+LMouse to move windows by clicking anywhere inside them
^!LButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
return
; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
