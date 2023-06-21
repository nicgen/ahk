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

; HOTSTRINGS
; -------------------------------------------------------------------
; COMMON
; -------------------------------------------------------------------
; date
; [AHK date format - docs](https://www.autohotkey.com/docs/v2/lib/FormatTime.htm)

:*c:;dmy::
{
    CurrentDateTime := FormatTime(, "dd-MM-yy" )
    pasteClipBoard(CurrentDateTime)
return
}

:*c:;ymd::
{
    CurrentDateTime := FormatTime(, "yy-MM-dd" )
    pasteClipBoard(CurrentDateTime)
return
}

::;d::
{
    CurrentDateTime := FormatTime(, "dd-MM-yyyy HH:mm" )
    pasteClipBoard(CurrentDateTime)
return
}

::;df::
{
    CurrentDateTime := FormatTime(, "dddd dd MMMM yyyy - HH:mm" )
    pasteClipBoard(CurrentDateTime)
return
}

::;ds::
{
    CurrentDateTime := FormatTime(, "yyyyMMddHHmmss" )
    ; SendInput(Format("{1:x}", CurrentDateTime)) ; epoch time in Hexadecimal
    pasteClipBoard(Format("{1:x}", CurrentDateTime))
return
}

; ID
; -------------------------------------------------------------------

::;id::
{
    global ID_name
    ; Send("{Raw}" ID_name)
	pasteClipBoard(ID_name)
return
}

; phone number (line)
::;phone::
{
    global ID_line
    ; Send("{Raw}" ID_line)
	pasteClipBoard(ID_line)
return
}

; phone number (mobile)
::;mob::
{
    global ID_mobile
    ; Send("{Raw}" ID_mobile)
	pasteClipBoard(ID_mobile)
return
}

; address (home)
::;home::
{
    global ID_address
    ; Send("{Raw}" ID_address)
	pasteClipBoard(ID_address)
return
}

; @
; -------------------------------------------------------------------

; Public

::@::
{
    global MAIL_public
    ; Send(MAIL_public)
    pasteClipBoard(MAIL_public)
return
}

; Private

::@p::
{
    global MAIL_private
    ; Send("{Raw}" MAIL_private)
	pasteClipBoard(MAIL_private)
return
}

; Anon
::@a::
{
    global MAIL_anon
    ; Send("{Raw}" MAIL_anon)
	pasteClipBoard(MAIL_anon)
return
}

; Work
::@w::
{
    global MAIL_work
    ; Send("{Raw}" MAIL_work)
	pasteClipBoard(MAIL_work)
return

; Gmail
}
::@g::
{
    global MAIL_gmail
    ; Send("{Raw}" MAIL_gmail)
	pasteClipBoard(MAIL_gmail)
return

; Hotmail
}
::@h::
{
    global MAIL_hotmail
    ; Send("{Raw}" MAIL_hotmail)
	pasteClipBoard(MAIL_hotmail)
return
}

; yt-dl (cli cmd)
; -------------------------------------------------------------------

; download video best quality [source](https://askubuntu.com/a/1097056)
::;ytdlv::
{
    template := "youtube-dl.exe --output `"" . PATH_downloads . "`%(title)s-`%(id)s.`%(ext)s`" -cvw -f best --add-metadata --xattrs " . A_Clipboard
    ; Send("{Raw}youtube-dl.exe --output `"D:\data\private\downloads\`%(title)s-`%(id)s.`%(ext)s`" -cvw -f best --add-metadata --xattrs " A_Clipboard)
    MsgBox "You entered '" . template
    pasteClipBoard(template)
return
}

; download music
::;ytdlm::
{
    ; buffer := "youtube-dl.exe --output 'D:\data\public\media\music\_Bulk\' . (title)s- . '(id)s.' . '(ext)s' -xcvw --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --xattrs  A_Clipboard . 
    ; "{Raw}youtube-dl.exe --output `"D:\data\private\downloads\`%(title)s-`%(id)s.`%(ext)s`"  -xcvw --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --xattrs " A_Clipboard
    ; A_Clipboard := buffer
    ;MsgBox, %buffer%
    Send("{Raw}" "{Raw}youtube-dl.exe --output `"D:\data\private\downloads\`%(title)s-`%(id)s.`%(ext)s`"  -xcvw --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --xattrs " A_Clipboard)
return
}

; download playlist
::;ytdlplay::
{
    ; yt-dlp.exe [OPTIONS] URL [URL...]
    Send("yt-dlp.ex --ignore-config --output `"D:\data\private\downloads\`%(title)s-`%(id)s.`%(ext)s`" -xcvw --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --xattrs " A_Clipboard)
return
}

; others
; -------------------------------------------------------------------

; retrieve domain from url
::;dom::
{
    dom := StrLower(A_Clipboard)
    RegExMatch(dom, REGEX_domain, &domain)
    dom := domain[1]
    dom := StrTitle(dom)
    Sleep(100)
    ; Send("{raw}" dom)
	pasteClipBoard(dom)
return
}

; load
; -------------------------------------------------------------------
#Include "hotstring_dev_markdown.ahk"