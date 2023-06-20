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
; [AHK date format - docs](https://www.autohotkey.com/docs/commands/FormatTime.htm)

:*c:;dmy::
{
    CurrentDateTime := FormatTime(, "dd-MM-yy" )
    SendInput(CurrentDateTime)
    return
}

:*c:;ymd::
{
CurrentDateTime := FormatTime(, "yy-MM-dd" )
SendInput(CurrentDateTime)
return
}

::;d::
{
CurrentDateTime := FormatTime(, "dd-MM-yyyy HH:mm" )
SendInput(CurrentDateTime)
return
}

::;df::
{
CurrentDateTime := FormatTime(, "dddd dd MMMM yyyy - HH:mm" )
SendInput(CurrentDateTime)
return
}

::;ds::
{
CurrentDateTime := FormatTime(, "yyyyMMddHHmmss" )
; SendInput(CurrentDateTime)
SendInput(Format("{1:x}", CurrentDateTime)) ; epoch time in Hexadecimal
return
}

; ID
; -------------------------------------------------------------------

::;id::
{
    global ID_name
    Send("{Raw}" ID_name)
return
}

; phone number (line)
::;phone::
{
    global ID_line
    Send("{Raw}" ID_line)
return
}

; phone number (mobile)
::;mob::
{
    global ID_mobile
    Send("{Raw}" ID_mobile)
return
}

; address (home)
::;home::
{
    global ID_address
    Send("{Raw}" ID_address)
return
}

; @
; -------------------------------------------------------------------

; Public

::@::
{
    global MAIL_public
    Send("{Raw}" MAIL_public)
return
}

; Private

::@p::
{
    global MAIL_private
    Send("{Raw}" MAIL_private)
return
}

; Anon
::@a::
{
    global MAIL_anon
    Send("{Raw}" MAIL_anon)
return
}

; Work
::@w::
{
    global MAIL_work
    Send("{Raw}" MAIL_work)
return

; Gmail
}
::@g::
{
    global MAIL_gmail
    Send("{Raw}" MAIL_gmail)
return

; Hotmail
}
::@h::
{
    global MAIL_hotmail
    Send("{Raw}" MAIL_hotmail)
return
}

; yt-dl (cli cmd)
; -------------------------------------------------------------------

; download video best quality [source](https://askubuntu.com/a/1097056)
::;ytdlv::
{
    Send("{Raw}youtube-dl.exe --output `"D:\data\private\downloads\`%(title)s-`%(id)s.`%(ext)s`" -cvw -f best --add-metadata --xattrs " A_Clipboard)
    ; SendRaw, Keys
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
    Send("{raw}" dom)
return
}

; load
; -------------------------------------------------------------------
#Include "hotstring_dev_markdown.ahk"