;Ignore this section
#NoEnv
#Warn

Menu, Tray, Icon, %A_WorkingDir%\poelab.png ,, 1
#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2
;poeWindowName = "Path of Exile ahk_class POEWindowClass"
;#IfWinActive poeWindowName

; *0 is caching - see https://www.autohotkey.com/docs/commands/URLDownloadToFile.htm
poelab_website := "*0 https://www.poelab.com/wp-content/labfiles"

;reload script - use when editing
^r::Reload
return

download_lab_layout()
{
    global difficulty
    global poelab_website
    UrlDownloadToFile, %poelab_website%/%difficulty%-%A_YYYY%-%A_MM%-%A_DD%.json, C:\Users\%A_UserName%\Downloads\%difficulty%-%A_YYYY%-%A_MM%-%A_DD%.json
    FileReadLine, first_line, C:\Users\%A_UserName%\Downloads\%difficulty%-%A_YYYY%-%A_MM%-%A_DD%.json, 1
    if (first_line = "<!DOCTYPE html>") {
        MsgBox, The Lord's Labyrinth has not been run yet.`nTry again later today.`n(The file will be deleted when you hit OK.)
        FileDelete, C:\Users\%A_UserName%\Downloads\%difficulty%-%A_YYYY%-%A_MM%-%A_DD%.json
    }
    if (first_line = "your ip has been temporarily banned for too many consecutive 404s") {
        MsgBox, Your IP has been temporarily banned for too many attempts.
        FileDelete, C:\Users\%A_UserName%\Downloads\%difficulty%-%A_YYYY%-%A_MM%-%A_DD%.json
    }
    return
}

F9::
difficulty := "normal"
download_lab_layout()
return

F10::
difficulty := "cruel"
download_lab_layout()
return

F11::
difficulty := "merciless"
download_lab_layout()
return

F12::
difficulty := "uber"
download_lab_layout()
return