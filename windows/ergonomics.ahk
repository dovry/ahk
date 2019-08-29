#NoEnv
#singleinstance force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#EscapeChar, |


; RShift+LShift to toggle CapsLock
LShift & RShift::CapsLock
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
