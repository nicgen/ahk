#Requires AutoHotkey v2.0
; REMINDER
; -------------------------------------------------------------------
; :*c:      ; auto trigger
; ::        ; wait for a tab/space

; HOTKEYS QUICK REFERENCE
; -------------------------------------------------------------------
; !   Alt
; ^   Ctrl
; +   Shift
; #   Windows key

; HOTKEYS
; -------------------------------------------------------------------

; Convert text to upper
^u::
{
  Send "{Raw}" StrUpper(A_Clipboard)
return
}

; Convert text to lower
^l::
{
  Send "{Raw}" StrLower(A_Clipboard)
return
}

; Convert text to capitalized
^k::
{
  Send "{Raw}" StrTitle(A_Clipboard)
return
}

; Empty Trash (on C:\)
^#Backspace::
{
  FileRecycleEmpty("C:\")
  SoundPlay(ASSETS_sound . "\fx\FX_crumpled-paper.wav")
return
}

; Search with Everything w/ #+S shortcut
#!s:: ; win+alt+s
{
  app := getPath("program") . "\Everything\Everything.exe"
  ; Run app ,, "max" ; enlarge the window
  Run app
return
}

; open qalculate
#!c:: ; win+alt+c
{
  app := getPath("program") . "\Qalculate\qalc.exe"
  Run app
return
}

; shortcut to close an app, due to the lack of consistency between apps
^q::  ; win+q
{
  if WinActive("ahk_class  MozillaWindowClass")       ; Firefox
  {
    Send "^Q" ; ctrl+shift+q (or ctrl+Q
  }
  else if WinActive("ahk_exe  Code.exe")               ; Vscode
  {
    WinClose
  }
  else if WinActive("ahk_exe Taskmgr.exe") ; NOK, doesn't work 19-06-2023 17:40
  {
    ; Send "{LAlt down}{F4 down}"
    ; Sleep(666)
    ; Send "{LAlt up}{F4 up}"
    ; ---
    ; Send "!{F4}"
    ; ---
    ; WinClose
    ; ---
    MsgBox WinExist("WinTitle")
  }
  else
  {
    Send "!{F4}"
  }                                               ; others
return
}

; CONTEXT SENSITIVITY
; -------------------------------------------------------------------

; Vampire Survivors
; -------------------------------------------------------------------
#HotIf WinActive("ahk_exe VampireSurvivors.exe", )
  ; more EGGS!!! (note, not needed since the addition of eggman in moonglow)
  !SPACE:: ; alt+space
{
  Loop 100 ; does x iterations
  {
    Send "{Enter}"
    Sleep(100)
    Send "{LButton}"
    Sleep(100)
    Send "{SPACE}"
    Sleep(100)
    Send "{RButton}"
    Sleep(100)
    Send "{MButton}"
    Sleep(100)
  }
return
}

  !r:: ; macro to restart a run
  ; [Steamlists](https://steamlists.com/vampire-survivors-how-to-quick-restart-using-autohotkey-macro/)
{
  Send "{Escape}{Left 4}{Space}{Left}{Space 2}" ; exit session
  Sleep(1000) ; home screen animation
  Send "{Space 6}"
  Sleep(500) ; arcanas animation
  Send "{Space}"
  Sleep(100)
  Send "{Escape}{Right 3}{Down 1}{Space}"
  Sleep(500)
  Send "{Space}"
  Loop 17 ; does x iterations
    {
      Send "{Space}"
      Sleep(100)
    }
  Send "{Space}" ; Big Coin
  SoundBeep(200, 1000)
return
}

  ; unlock Smith IV [Vampire-survivors.fandom](https://vampire-survivors.fandom.com/wiki/Smith_IV)
;   ;!c::
; {
;    Send,humbug
;    SoundBeep, 300, 1000
;   return
; }
#HotIf ; turn off context sensitivity (\Vampire Survivors)

; Diablo IV\
; -------------------------------------------------------------------
#HotIf WinActive("ahk_exe Diablo IV.exe", )
  ; relaunch Joplin (theme design)
  !SPACE:: ;alt+space
{
  MsgBox("Diablo IV")
  ; TODO: macro for a perfect Shout timer
  ; 1 > 2 > 3
  ; 1 - rallying cry
  ; 2 - war cry
  ; 3 - challenging shout
return
}
#HotIf ; turn off context sensitivity (\Diablo IV)

; Joplin
; -------------------------------------------------------------------
#HotIf WinActive("ahk_exe Joplin.exe", )
  ; relaunch Joplin (theme design)
  !SPACE:: ;alt+space
{
  global PATH_appdata
  Send "^q" ; quit
  Run(PATH_appdata "\Programs\Joplin\Joplin.exe")
  SoundPlay(ASSETS_sound "\fx\ui_message_toast.wav")
return
}
#HotIf ; turn off context sensitivity (\Joplin)

; Firefox
; -------------------------------------------------------------------
#HotIf WinActive("ahk_class MozillaWindowClass", )
  ; relaunch Joplin (theme design)
  !SPACE:: ;alt+space
{
  buffer := A_Clipboard
  Sleep(100)
  Send "!d"
  Sleep(25)
  Send "^c"
  Sleep(100)
  url := A_Clipboard
  ; MsgBox("Your are in Firefox,`nBrowsing:" . url)
  if (InStr(url, "https://www.amazon." , 0))
  {
    browseCamelCamel(url)
  } else {
    MsgBox("Your are in FIREFOX,`nBrowsing:" . url)
  }
  A_Clipboard := buffer
  Sleep(100)
return
}
#HotIf ; turn off context sensitivity (\Firefox)
