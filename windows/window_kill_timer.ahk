#NoEnv
;#NoTrayIcon
#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2

f1::
KeyWait, LButton
;WinGetTitle, kill_target, A
;msgbox, %kill_target%
msgbox left button
return