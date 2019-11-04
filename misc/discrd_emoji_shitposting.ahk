#NoEnv
#singleinstance, force

; Open react menu on a message
; Then press Ctrl+Shift+Enter
#IfWinActive ahk_exe discord.exe
^+Enter::
loop 20 {
Send, {shift down}{enter}{shift up}{right}
}