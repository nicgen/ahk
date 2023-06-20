
; subaddress (alias function)
; :*c:@sub::
;     InputBox, Alias, "Write the alias of the mail:", , , 300, 100
;     if ErrorLevel
;         ; MsgBox, CANCEL was pressed.
;         TrayTip, , CANCEL was pressed, 1
;     else
;         StringLower Clipboard, Clipboard
;         RegExMatch(Clipboard, REGEX_domain, domain)
;         SendRaw, nicolas.genty+%Alias%_%domain1%@pm.me
; return

; subaddress (alias function)
:*c:@sub::
{
    IB := InputBox("", "`"Write the alias of the mail:`"", "w300 h100"), Alias := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
    if ErrorLevel
        ; MsgBox, CANCEL was pressed.
        TrayTip(, "CANCEL was pressed")
    else
        A_Clipboard := StrLower(A_Clipboard)
        RegExMatch(A_Clipboard, REGEX_domain, &domain)
        Send("{Raw}nicolas.genty+" Alias "_" domain[1] "@pm.me")
return
}

; URL
; -------------------------------------------------------------------

; TODO ClipBoard link analyser (amazon, link, google, etc.)

; Camelcamelcamel
; :*c:;cam::
;     ; urlDomain := Clipboard
;     RegExMatch(Clipboard, "\/([\w]{10})\/?\b", productID) ; regex to return the amazon productID
;     ;MsgBox, %productID1%
;     IfWinExist, ahk_class MozillaWindowClass
;     {
;         WinActivate ; Use the window found by IfWinExist.
;         WinMaximize ; Same as above.
;         ; Send, Some text.{Enter}
;         Send ^t
;         SendRaw, https://fr.camelcamelcamel.com/product/%productID1%
;         Send, {Enter}        
;         return
;     }
;         ; else run firefox
;         else
;     {
;         WinActivate ; Use the window found by IfWinExist.
;         WinMaximize ; Same as above.
;         Send ^t
;         ; Run, firefox.exe -new-window https://fr.camelcamelcamel.com/product/%regex%
;         SendRaw, https://fr.camelcamelcamel.com/product/%productID1%
;         Send, {Enter}
;     }
; return

:*c:;cam::
    ; urlDomain := Clipboard
{
    RegExMatch(A_Clipboard, "\/([\w]{10})\/?\b", &productID) ; regex to return the amazon productID
    ;MsgBox, %productID1%
    if WinExist("ahk_class MozillaWindowClass")
    {
        WinActivate() ; Use the window found by IfWinExist.
        WinMaximize() ; Same as above.
        ; Send, Some text.{Enter}
        Send("^t")
        Send("{Raw}https://fr.camelcamelcamel.com/product/" productID[1])
        Send("{Enter}")
        return
    }
        ; else run firefox
        else
    {
        WinActivate() ; Use the window found by IfWinExist.
        WinMaximize() ; Same as above.
        Send("^t")
        ; Run, firefox.exe -new-window https://fr.camelcamelcamel.com/product/%regex%
        Send("{Raw}https://fr.camelcamelcamel.com/product/" productID[1])
        Send("{Enter}")
    }
return
}
