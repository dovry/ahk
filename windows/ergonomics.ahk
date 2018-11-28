#NoEnv
#singleinstance force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Pauses the script // Shift+Escape
+Esc::
  Suspend, Toggle
  return
  
;Exits the script // Ctrl+Shift+Escape
^+Esc:: 
  ExitApp


; Set CapsLock as CTRL
CapsLock::Ctrl
Return

; toggle Capslock
    $*+CapsLock::
      if GetKeyState("Capslock", "T") = 0
        SetCapsLockState, On
      else
        SetCapsLockState, AlwaysOff
    return

; alt+y for paranthesis
; alt+u for brackets
; alt+i for braces

!y::
send {(}
send {)}
send {Left}
return
!u::
send {[}
send {]}
send {Left}
return
!i::
send {{}
send {}}
send {Left}
return
