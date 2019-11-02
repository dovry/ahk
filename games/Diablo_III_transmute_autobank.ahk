;Ignore this section
#NoEnv

;Removes the AHK icon from your taskbar, just remove these two lines if you really want the icon
;#NoTrayIcon
Menu, Tray, Icon, %A_WorkingDir%\icons\d3.png ,, 1
#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2
#IfWinActive Diablo III

;Pauses the script // Shift+Escape
+Esc::
  Suspend, Toggle
  return
  
;Exits the script // Ctrl+Escape
^Esc:: 
  ExitApp
  
;Salvage

;White items
F2::
MouseMove, 515, 480, 0
sleep, 10
MouseClick
sleep, 10
MouseMove, 255, 290, 0
Sleep, 10
MouseClick
sleep, 10
Mousemove, 850, 375, 0
sleep, 10
MouseClick
return

;Blue items
F3::
MouseMove, 515, 480, 0
Sleep, 10
MouseClick
sleep 10
MouseMove, 320, 290, 0
Sleep 10
MouseClick
sleep 10
Mousemove, 850, 375, 0
sleep 10
MouseClick
return

;Yellow items
F4::
MouseMove, 515, 480, 0
Sleep, 10
MouseClick
Sleep, 10
MouseMove, 385, 290, 0
Sleep 10
MouseClick
sleep 10
Mousemove, 850, 375, 0
sleep 10
MouseClick
return

;Banking a single column

F5::

loop, 6 {
MouseClick Right
sleep, 5
Mousemove, 0, 50, 0, R
sleep, 5
}
MouseMove, 48,-300, 0, R
return

;Bank the first three columns
F6::
Mousemove, 1425, 585, 0
Loop, 3 {
	
loop, 6 {
MouseClick Right
sleep, 5
Mousemove, 0, 50, 0, R
sleep, 5
}
MouseMove, 48,-300, 0, R
}
return

;Banking everything but the last column

F7::
Mousemove, 1425, 585, 0
Loop, 9 {
	
loop, 6 {
MouseClick Right
sleep, 5
Mousemove, 0, 50, 0, R
sleep, 5
}
MouseMove, 48,-300, 0, R
}
return

;Swap item (located in penultimate slot of last column
;press I, 5678, I and go ham.
;I use this with Broken Crown for gem farming

5::
MouseGetPos, xa, ya 
return
6::
MouseMove, 1885, 780
return
7::Click Right
return
8::
MouseMove, %xa%, %ya%
return
9::i