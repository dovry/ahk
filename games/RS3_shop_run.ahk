;Ignore this section
#NoEnv
 
;Removes the AHK icon from your taskbar, just remove these two lines if you really want the icon
;#NoTrayIcon
 
#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2
 
;The 'back' button on the side of your mouse
XButton1::Shift
;The 'forward' button on your mouse
XButton2::LControl
 
 
+1::Click Right
return
+2::Mousemove,0,37,0,R
return
+3::Click
return
 
+q::Click Right
return
+w::Mousemove,0,120,0,R
return
+e::Click
return
+r::Mousemove,54,-120,0,R
return
 


^F1:: Suspend