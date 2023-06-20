; RELOAD AHK script
; reload script visual and audio indication that the script was restarted
; source: https://stackoverflow.com/questions/15706534/hotkey-to-restart-autohotkey-script#15709228
^#!r:: 
{
    global ASSETS_sound
    SoundPlay(ASSETS_sound "\fx\ui_message_toast.wav")
    Send("^s") ; To save a changed script
    Sleep(300) ; give it time to save the script
    Reload()
return
}

; Edit script
^!#e::Edit

; #Include "experiments.ahk"
; ^+k::
; {
;     if (isItURL(A_Clipboard))
;     {
;         MsgBox( A_Clipboard . "`n is a valid URL")
;     } else {
;         MsgBox( A_Clipboard . "`n is not a valid URL")
;     }
; }
