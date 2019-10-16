#NoEnv
#SingleInstance Force
#NoTrayIcon
#KeyHistory 0
SetBatchLines -1
ListLines, Off
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
SetWorkingDir, %A_ScriptDir%

; keeps Right Mouse working
RButton::Send {RButton}

; play/pause
!F9::send {Media_Play_Pause}
~RButton & LButton::Send {Media_Play_Pause}
Return

; Prev
!F10::Send {Media_Prev}
RButton & XButton1::Send {Media_Prev}
Return

; Skip
!F11::Send {Media_Next}
RButton & XButton2::Send {Media_Next}
Return

; volume down
!^WheelDown::Send {Volume_Down}
RButton & WheelDown::Send {Volume_Down}
Return

; volume up
!^WheelUp::Send {Volume_Up}
RButton & WheelUp::Send {Volume_Up}
Return
