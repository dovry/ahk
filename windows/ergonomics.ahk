#NoEnv
#singleinstance force
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%
#EscapeChar, |

; icon
Menu, Tray, Icon, %A_WorkingDir%\icons\ergonomics.png ,, 1

;reload script - use when editing
;^r::Reload
;return

; RShift+LShift to toggle CapsLock
;LShift & RShift::CapsLock
RShift & LShift::CapsLock

; Set Capslock as Ctrl
$CapsLock::Ctrl

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

!t::send, {|% 2}{Left}
return

!'::send, {* 2}{Left}
return

!3::send, {` 6}{Left 3}
return

!4::send, ${{}{}}{Left 1}

!+4::send, "${{}{}}"{Left 2}
return


;; Programs

^!p::Run, Powershell.exe
return

^!+p::
Run *RunAs Powershell.exe
return

; Bring vs code to focus if a window exists, else open
^!c::
IfWinExist, ahk_exe Code.exe
  WinActivate, ahk_exe Code.exe
else
Run Code
;MsgBox,,, bruh,0.5
return