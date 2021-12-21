#NoEnv
#SingleInstance, force
#Persistent
#installKeybdHook
TrayTip, %A_ScriptName%, Started, 1
;SoundBeep, 250, 250
SendMode Input
SetWorkingDir %A_ScriptDir%
; icon
Menu, Tray, Icon, %A_WorkingDir%\icons\ergonomics.png ,, 1
;Ctrl+Win+Alt+Hotkey
^#!e::edit %A_ScriptName% ; edit the script
^#!r::reload %A_ScriptName% ; reload the script

;----- Includes / Libs
; %USERPROFILE%/Documents/AutoHotKey/Lib
#Include, <GetSelectionCoords>
;-----

;----- Global vars

;-----

;----- add EXEs that should be ignored
Groupadd, ignore_these, ahk_exe ahk_exe RuneLite.exe
Groupadd, ignore_these, ahk_exe ahk_exe rs2client.exe
Groupadd, ignore_these, ahk_exe ahk_exe Wow.exe
;GroupAdd, ignore_these, ahk_exe PathOfExile.exe
;GroupAdd, ignore_these, ahk_exe PathOfExileSteam.exe
;GroupAdd, ignore_these, ahk_exe PathOfExile_x64.exe
;GroupAdd, ignore_these, ahk_exe PathOfExile_x64Steam.exe

SetTimer CheckWindow, 250
CheckWindow:
If WinActive("ahk_group ignore_these")
  {
  Suspend , On
  }
Suspend , Off
Return

#!Rbutton:: ;Win+Alt+Rbutton to activate, Lbutton drag to get coords
getSelectionCoords(x_start, x_end, y_start, y_end)
Clipboard := x_start . x_end . y_start . y_end
return

~Rbutton & WheelDown::send, {WheelDown 5}
~Rbutton & WheelUp::send, {WheelUp 5}

;Ctrl+Alt+Shift+Down arrow to get a window's class
!^+Down::
  WinGetClass, class, A
  Clipboard := class
  MsgBox, The active window's class is "%class%".`nIt has been added to your clipboard
return

; Ctrl+Alt+Shift+Up arrow to get a window's name
!^+Up::
WinGetTitle, Title, A
  Clipboard := Title
MsgBox, The active window is "%Title%".`nIt has been added to your clipboard
return

SetCapsLockState, AlwaysOff
; RShift+LShift to toggle CapsLock
RShift & LShift::CapsLock

; Set Capslock as Ctrl
*CapsLock::Ctrl

; Shift+Ctrl+Alt+R to restart sound driver
!^+R::
RunWait,sc stop "AudioSrv" ;Stop AudioSrv service.
sleep 100
RunWait,sc start "AudioSrv" ;Start AudioSrv service.

!#s::
cmd=c:\windows\system32\control.exe mmsys.cpl,,2
Run, %cmd%
return

;;Send current date
;::..d::
;FormatTime, CurrentDate,, dd MMMM yyyy
;SendInput %CurrentDate%
;
;; Send current Time
;::..t::
;FormatTime, CurrentDateTime,, HH:mm:ss
;SendInput %CurrentDateTime%


; alt+hotkey
; y for ()
; u for []
; i for {}
; w for ""
; Shift+e for "{{  }}" - Yaml variables
; t for %%
; ' for **
; 3 for `````` - Markdown codeblock
; 4 for ${} - Terraform variables
; Shift+4 for "${}" - Standalone Terraform variables
; Shift+AltGr+4 for "$" - shell vars

!y::send, {(}{)}{Left}

!u::send, {[}{]}{Left}

!i::send, {{}{}}{Left}

!w::send, {" 2}{Left}

+!e::Send, {"}{{ 2}{space 2}{}}{}}{"}{Left 4}

!t::send, {`% 2}{Left}

!'::send, {* 2}{Left}

!3::send, {` 6}{Left 3}

!4::send, ${{}{}}{Left 1}

!+4::send, "${{}{}}"{Left 2}

<^>!+4::send, "$"{Left 1}

NumpadDot::Send, . ; change numbpad comma to period

;; Programs

; Runs powershell 7 if it exists, fallsback to default installation
^!p::
if FileExist("C:\Program Files\PowerShell\7\pwsh.exe")
    Run, pwsh.exe
else
  run, powershell.exe
return

; Runs powershell 7 if it exists, fallsback to default installation
^!+p:: ; Ctrl+Alt+Shift+P opens powershell as admin
if FileExist("C:\Program Files\PowerShell\7\pwsh.exe")
  Run *RunAs pwsh.exe
else
  Run *RunAs Powershell.exe
return

^!+c:: ; Ctrl+Alt+Shift+C opens command prompt as admin
Run *RunAs cmd.exe 
return

;Restart explorer.exe
!F2::Process, Close, explorer.exe

; Win+Alt+n open notepad2
if FileExist("C:\Program Files\Notepad2\Notepad2.exe")
  Run *RunAs Notepad2.exe
else
  Run *RunAs Powershell.exe
return

#!n::Run, C:\Program Files\Notepad2\Notepad2.exe, C:\Program Files\Notepad2
; Win+Alt+c open calculator
#!c::Run, C:\Program Files (x86)\LoreSoft\Calculator.NET\Calculator.exe, C:\Program Files (x86)\LoreSoft\Calculator.NET


; alt+p opens previous page in new tab
#IfWinActive ahk_exe chrome.exe
  !p::
    SendInput +!T
    SendInput ^+{Enter}
  return
#IfWinActive

; Right control + F11 to get cursor coordinates and colour below cursor
Rctrl & F11::
  DoFastGrab:
    MouseGetPos, oposx, oposy
    Sleep 300
    PixelGetColor, grabcolor, %oposx%, %oposy%, RGB
    Sleep 300
    Clipboard = %oposx%,%oposy%,%grabcolor%
    ClipWait
    Soundbeep,750
Return

!#Left::
  WinGetTitle, Title, A
  WinSet, ExStyle, ^0x80, %Title%
  Send {LWin down}{Ctrl down}{Left}{Ctrl up}{LWin up}
  sleep, 50
  WinSet, ExStyle, ^0x80, %Title%
  WinActivate, %Title%
Return

!#Right::
  WinGetTitle, Title, A
  WinSet, ExStyle, ^0x80, %Title%
  Send {LWin down}{Ctrl down}{Right}{Ctrl up}{LWin up}
  sleep, 50
  WinSet, ExStyle, ^0x80, %Title%
  WinActivate, %Title%
Return

Virtual_Desktop_detection(){
  RegRead, cur, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops, CurrentVirtualDesktop
  RegRead, all, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
  ix := floor(InStr(all,cur) / strlen(cur))
  msgbox current desktop index: %ix%
}
