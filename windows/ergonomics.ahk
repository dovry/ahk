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


; Set CapsLock as backspace
CapsLock:: Send {BackSpace}
Return

; toggle Capslock
    $*+CapsLock::
      if GetKeyState("Capslock", "T") = 0
        SetCapsLockState, On
      else
        SetCapsLockState, AlwaysOff
    return

; alt+h for paranthesis
; alt+j for brackets
; alt+k for braces

!h::
send {(}
send {)}
send {Left}
return
!j::
send {[}
send {]}
send {Left}
return
!k::
send {{}
send {}}
send {Left}
return
