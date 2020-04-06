#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#if WinActive("ahk_exe Terraria.exe")

; Right shift + o 
>+o::
loop, 8
{
    send, {RButton}
    sleep, 20
    Mousemove,0,64,0,R
    sleep, 200
}
return