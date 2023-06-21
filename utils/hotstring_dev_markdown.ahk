; Markdown (for Joplin/Logseq)
; -------------------------------------------------------------------

; return formated code block
::;mc::
{
    code := A_Clipboard
    Sleep(100)
    userInput := InputBox("prompt", "Language", "w300 h100", "bash")
    ; IB := InputBox("Please enter a phone number.", "Phone Number", "w640 h480")
    if userInput.Result = "Cancel"
        MsgBox "You entered '" userInput.Value "' but then cancelled."
    else        
        template := "
        (
        ``````input
        code
        ``````
        )"

        template := StrReplace(template, "input" , userInput.Value)
        template := StrReplace(template, "code" , code)
        Sleep(100)
    ; Send("{Raw}" template)
    pasteClipBoard(template)
return
}

; send table of content block
::;t::
{
    template := "`$`{toc`}"
    pasteClipBoard(template)
return
}
; {
;     Send("{Raw}" "${toc}")
; }

; format clipboard to a markdown link [domain](url)
::;ml::
{
    global REGEX_domain

    switch A_Clipboard
    {
        case InStr(A_Clipboard, "github.com" , 0):
            domain := "GitHub"
        case InStr(A_Clipboard, "stackoverflow.com" , 0):
            domain := "stackoverflow"
        case InStr(A_Clipboard, "superuser.com" , 0):
            domain := "superuser"
        case InStr(A_Clipboard, "serverfault.com" , 0):
            domain := "serverfault"
        case InStr(A_Clipboard, "reddit.com" , 0):
            domain := "reddit"
        case InStr(A_Clipboard, "gitlab.com" , 0):
            domain := "GitLab"
        ; for future case
        ; case InStr(A_Clipboard, "newentry" , 0):
        ;     domain := "label"
        default:
            match := RegExMatch(A_Clipboard, REGEX_domain , &domain)
            if (match)
            {
                domain := domain[1]
            } else {
                MsgBox( A_Clipboard . "is not a valid URL" )
                ; Exit
            }
    }
    ; }
    template := "[domain](url)"
    template := StrReplace(template, "domain" , domain)
    template := StrReplace(template, "url" , A_Clipboard)
    ; Send("{Raw}" template)
    pasteClipBoard(template)
return
}

; format clipboard to a markdown link [source](url)
::;ms::
{
    if (RegExMatch(A_Clipboard, REGEX_domain , &domain))
    {
        template := "([source](" . StrLower(A_Clipboard) . "))"
        pasteClipBoard(template)
        ; Send("{Raw}" template)
    } else {
        MsgBox( A_Clipboard . "is not a valid URL" )
        ; Exit
    }
return
}
