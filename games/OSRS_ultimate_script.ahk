;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;As of the 26th of January 2017 AHK is no longer allowed
;If you get banned for this you have only yourself to blame
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;Ignore this section
#NoEnv

;Removes the AHK icon from your taskbar, just remove these two lines if you really want the icon
#NoTrayIcon

#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2
;#If or WinActive("OSBuddy")
; Ok, continue reading

;===============================================================
;===============        Created by Guthlx        ===============
;===============================================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;						Table of contents (ctrl+f to find what you're looking for)
;	1. Hotkeys
;	2. Client / Script
;	3. Dropping / Runecrafting
;       3.1 - Inventory jumping
;	4. Blackjacking
;	5. Fletching
;	6. Email/Password + Alt account
;	7. Construction - Tables
;		7.1 - Larders
;   8. Magic + Smithing - Superheat
;	9. Future plans

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;You may change the hotkey combinations to whatever you want
;Just make sure that no keys overlap

; 1. Hotkeys

; //	! = Alt 	//
;	//	^ = Ctrl 	//
;	//	+ = Shift 	//
;	//	# = Win key //

;###############################################################################
;###############################################################################
;###############################################################################

;	2. Client / Script

;Pauses the script // Shift+Escape
+Esc::
  Suspend, Toggle
  return
  
;Exits the script // Ctrl+Escape
^Esc:: 
  ExitApp

; Minimizes OSBuddy // Ctrl+F1
^F1:: WinMinimize, OSBuddy

; Resizes the client to whatever resolution you wish // Ctrl+F12
^F12::ResizeWin(1366,768)
;	change this ^^^^^^^^^^^^
ResizeWin(Width = 0,Height = 0)
{
  WinGetPos,X,Y,W,H,A
  If %Width% = 0
    Width := W
  If %Height% = 0
    Height := H
  WinMove,A,,%X%,%Y%,%Width%,%Height%
}

;###############################################################################
;###############################################################################
;###############################################################################

;	3. Dropping / Runecrafting / Withdraw 14 (herb, craft, whatever)
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;	!!! disable Settings > Widgets > Price Guide > 'shift-click Lookup' in OSBuddy
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; Shift+1 2 3 drops items with 'drop' as 3rd option and Shift+4 sends cursor from last item to first in next r
;It also empties RC pouches, Edge tele on glory and duel arena on duel rings
; Shift+3 2 3 2	Fills RC pouches
+1::Click Right	
return
+2::Mousemove,0,37,0,R	
return
+3::Click
return
+4::MouseMove, 0,-37, 0, R
return

; Shift+qwe	deposits runes, withdraws essence
+q::Click Right	
return
+w::Mousemove,0,74,0,R
return
+e::Click
return
+r::MouseMove,0,-74,0,R
return

;###############################################################################
;###############################################################################
;###############################################################################

;   3.1 - Inventory jumping

;Shift+Space jumps from bottom item to top item in next row
+Space:: MouseMove, 42, -222, 0, R

;Ctrl+Space jumps from last item in last row to first item in first row
^Space:: MouseMove, -122, -224, 0, R

;###############################################################################
;###############################################################################
;###############################################################################

;	4. Blackjacking

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;You need to lure the Bandits manually or use Shift+QWE
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

+a::Click Right	
return
+s::Mousemove,0,92,0,R	
return
+d::Click
return
+f::MouseMove,0,-92,0,R
return

+z::Click Right	
return
+x::Mousemove,0,55,0,R
return
+c::Click
return
+v::MouseMove,0,-55,0,R
return

;###############################################################################
;###############################################################################
;###############################################################################

;	5. Fletching ((numpad has to be on) num 123)

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; How this works: Spam 123 123 123 123, this gives the best xp since
; using feather > bolt > bolt > feather back and forth is faster than
; feather > bolt | feather > bolt
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; If your keyboard doesn't have a numpad you can swap
; the hotkeys for whatever you want.
; just try to use a ctrl, alt, win or shift key with it
; to prevent MouseMove when typing
Numpad1::Click
return
Numpad2::
if left != 1
{
  MouseMove, 40, 0, 0, R
  left := 1
  return
}
else
{
  MouseMove, -40, 0, 0, R
  left := 0
  return
}
return
Numpad3::Click
return

;###############################################################################
;###############################################################################
;###############################################################################

;	6. Email/Password + Login

; You can add as many accounts as you want, just copy/paste and modify the hotkeys to not overlap
; Try not to use any key combinations you could accidentally press, you wouldn't want to
; broadcast your e-mail address in-game

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; DO NOT use a variation of this command in-game, as this could flag the autotyper antibot.
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; Ctrl+Alt+Hotkey
^!q::
Sendinput User{Tab}
return
^!w::
Sendinput Pass
return
^!a::
Sendinput User{Tab}
return
^!s::
Sendinput Pass
return

;###############################################################################
;###############################################################################
;###############################################################################

;	7 Construction - Tables

;shift u, i, o ,p (I use my left thumb on RightShift and four other fingers on UIOP
;remap if you have small hands

+u:: Send 1
return
+i::Click Right
return
+o::MouseMove, 0, 55, 0, R
return
+p::click
return

;	7.1 Construction - Larders

;Numpad 4, 5, 6, 8

Numpad4::Rbutton
return
Numpad5::MouseMove 0, 50, 0, R
return
Numpad6::click
return
Numpad8::MouseMove 0, 70, 0, R
return

;###############################################################################
;###############################################################################
;###############################################################################

;   8. Magic + Smithing - Superheat
;   Space key + fghj (rebind to whatever you want if you dont like the positioning of your fingers

Space:: SendInput {Space}
return
Space & f::click
return
Space & g::Mousemove,0, 140, 0, R
return
Space & h::click
return
Space & j::Mousemove,0, -140, 0, R
return

;###############################################################################
;###############################################################################
;###############################################################################

;	9. Future plans

; Thinking of other shit to add, pm me in game: 'Guthlx' if you have any ideas!
