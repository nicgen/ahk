#Requires AutoHotkey v2.0
; HEADER
; -------------------------------------------------------------------
; #Warn                               ; enables or disables warnings for specific conditions which may indicate an error, such as a typo or missing "global" declaration.
KeyHistory(0)                       ; displays script info and a history of the most recent keystrokes and mouse clicks
InstallKeybdHook()                  ; forces the unconditional installation of the keyboard hook (500 KB of memory but needed for hotstring)
#SingleInstance Force               ; skips the dialog box and replaces the old instance automatically
SendMode("Input")                   ; makes send synonymous with sendinput or sendplay rather than the default (sendevent), also makes click and mousemove/click/drag use the specified method (recommended for new scripts due to its superior speed and reliability)
SetTitleMatchMode(2)                ; set title match mode to "contains"
; SetCapsLockState / SetNumLockState / SetScrollLockState
; sets the state of capslock/numlock/scrolllock. can also force the key to stay on or off.
SetNumLockState("AlwaysOn")
SetCapsLockState("AlwaysOff")
SetScrollLockState("AlwaysOff")
SetWorkingDir(A_ScriptDir)          ; ensures a consistent starting directory.

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

; -------------------------------------------------------------------
; VARS
; -------------------------------------------------------------------

#Include ".env"

; -------------------------------------------------------------------
; SCRIPTS
; -------------------------------------------------------------------

#Include "utils\functions.ahk"
#Include "utils\startup.ahk"
#Include "utils\hotkeys.ahk"
#Include "utils\hotstring.ahk"
; #Include "utils\AutoCorrect.ahk"
#Include "utils\tests.ahk" ; for debug only