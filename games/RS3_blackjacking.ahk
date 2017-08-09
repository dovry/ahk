;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;As of the 26th of January 2017 AHK is no longer allowed
;If you get banned for this you have only yourself to blame
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force
 
XButton1::LControl
 
^1::Click Right
return
^2::Mousemove,0,37,0,R
return
^3::Click
return
^4::Mousemove,0,-37,0,R
return
 
^q::Click Right
return
^w::Mousemove,0,78,0,R
return
^e::Click
return
^r::Mousemove,0,-78,0,R
return
 
^a::Click Right
return
^s::Mousemove,0,58,0,R
return
^d::Click
return
^f::Mousemove,0,-58,0,R
return