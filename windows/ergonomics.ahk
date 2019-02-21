#NoEnv
#singleinstance force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#EscapeChar, \

; Pauses the script // Rshift+Escape
>+Esc::Suspend, Toggle
return
  
; Exits the script // RCtrl+Escape
>^Esc::ExitApp

; RShift+Capslock to toggle CapsLock
>+CapsLock::CapsLock

; Set Capslock as Ctrl
$CapsLock::Ctrl

; RShift
>+Space::Send, {Shift up}{End}

; alt+hotkey
; y for ()
; u for []
; i for {}
; w for ""
; e for "{{  }}" - Yaml variables
; t for %%
; ' for **

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

!t::send, {\% 2}{Left}
return

!'::send, {* 2}{Left}
return

; ` + 3 to send codeblock formatting

` & 3::send, {` 6}{Left 3}
return 
