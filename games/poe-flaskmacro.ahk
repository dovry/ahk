#IfWinActive Path of Exile
#SingleInstance force
#NoEnv
#Warn
#Persistent

;https://autohotkey.com/docs/Hotkeys.htm
;https://autohotkey.com/docs/KeyList.htm

1::
{
;Initialize random delays between 57 and 114 ms (arbitrary values, may be changed)
random, delay2, 57, 114
random, delay3, 57, 114
random, delay4, 57, 114
random, delay5, 57, 114

;send, 1 ;simulates the keypress of the 1 button. If you use another button, change it!

sleep, %delay2%
send, 2 ;simulates the keypress of the 2 button. If you use another button, change it!

sleep, %delay3%
send, 3 ;simulates the keypress of the 3 button. If you use another button, change it!

sleep, %delay4%
send, 4 ;simulates the keypress of the 4 button. If you use another button, change it!

sleep, %delay5%
send, 5 ;simulates the keypress of the 5 button. If you use another button, change it!
}
return