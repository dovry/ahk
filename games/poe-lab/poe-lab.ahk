;Ignore this section
#NoEnv
#Warn

Menu, Tray, Icon, %A_WorkingDir%\poelab.png ,, 1
#SingleInstance Force
#Persistent
SetBatchLines -1
SetTitleMatchMode, 2
; global poeWindowName = "Path of Exile ahk_class POEWindowClass"
; #IfWinActive poeWindowName

; *0 is caching - see https://www.autohotkey.com/docs/commands/URLDownloadToFile.htm
poelab_website := "*0 https://www.poelab.com/wp-content/labfiles"

;reload script - use when editing
^r::Reload
return

download_lab_layout()
{
    global difficulty
    global poelab_website
    UrlDownloadToFile, %poelab_website%/%A_YYYY%-%A_MM%-%A_DD%_%difficulty%.jpg, lab_images\%difficulty%_%A_dd%_%A_MMM%_%A_YYYY%.jpg
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