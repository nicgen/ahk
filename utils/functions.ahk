#Requires AutoHotkey v2.0

; retrieve a path based on the os environment variables 
; note : cmd `set` retrieve os environment variables
; cheatSheet:
; LOCALAPPDATA=C:\Users\<user>\AppData\Local
; ProgramData=C:\ProgramData
; ProgramFiles=C:\Program Files
; ProgramFiles(x86)=C:\Program Files (x86)
; PUBLIC=C:\Users\Public
; TEMP=C:\Users\nic\AppData\Local\Temp
; USERDOMAIN=LAPTOP
; USERNAME=<user>
; USERPROFILE=C:\Users\<user>
getPath(p?)
{
    if IsSet(p)
    {
        switch p
        {
            case "user":
                return EnvGet("USERPROFILE")
            case "local":
                return EnvGet("LOCALAPPDATA")
            case "program":
                return EnvGet("ProgramFiles")
            case "programx86":
                return EnvGet("ProgramFiles(x86)")
            case "temp":
                return EnvGet("TEMP")
            default:
                return "C:/"
        }
    }
    else Exit
}

; check if the string in A_Clipboard is a valid URL
isItURL(str)
{
    if (RegExMatch(str, REGEX_urlValidation, &domain))
    {
        ; MsgBox( domain[0] . "`n is a valid URL")
        return true
    } else {
        ; MsgBox( str . "`n is not a valid URL")
        return false
    }
}

; use the clipboard to paste the result instead of sending-it
pasteClipBoard(var)
{
    buffer := A_Clipboard
    Sleep(100)
    A_Clipboard := var
    Sleep(100)
    ; if WinActive("ahk_exe WindowsTerminal.exe") ; ctrl+shift+v windows terminal
    ; {
    ;     MsgBox( var )
    ;     Send "^+v"
    ; } else {
    ;     Send "^v"
    ; }
    Send "^v"
    Sleep(100)
    A_Clipboard := buffer
    Sleep(100)
    ; buffer := unset
return
}

; browser
browseCamelCamel(url)
{
    regex := "https:\/\/www.amazon\.fr\/[\w\-%\/]+\/([A-Z0-9]{10})\/?"
    match := RegExMatch(url, regex , &result)
    ; MsgBox("Your are in AMAZON,`nYour product code:" . result[1])
    ; url := "https://fr.camelcamelcamel.com/product/" . result[1]
    url := "https://charts.camelcamelcamel.com/fr/" . result[1] . "/amazon.png?force=1&zero=0&w=500&h=500&desired=false&legend=1&ilt=1&tp=all"
    A_Clipboard := url
    Sleep(100)
    Send "^n" ; open a new window
    Sleep(400)
    Send "^v" ; paste the url
    Sleep(100)
    Send "{enter}"
return
}

; return a quote of infinite wisdom to start the day
writeQuote()
{
    quotes := [
    "`"Don't comment bad code - rewrite it.`"`nBrian Kernighan",
    "`"A programming language is for thinking about programs, not for expressing programs you've already thought of. It should be a pencil, not a pen.`"`nPaul Graham",
    "`"Sometimes it pays to stay in bed on Monday, rather than spending the rest of the week debugging Monday's code.`"`nDan Salomon",
    "`"It´s better to wait for a productive programmer to become available than it is to wait for the first available programmer to become productive.`"`nSteve McConnell",
    "`"One of my most productive days was throwing away 1000 lines of code.`" Ken Thompson",
    "`"Debugging is twice as hard as writing the code in the first place.Therfore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.`"`nRajanand",
    "`"System programmers are the high priests of a low cult.`"`nRobert S. Barton",
    "`"I don't care if it works on your machine! We are not shipping your machine!`"`nVidiu Platon",
    "`"Measuring programming progree by lines of code is like measuring aircraft building progree by weight.`"`nBill Gates",
    "`"If debudding is the process of removing software bugs, then programming must be the process of putting them in.`"`nEdsger W. Dijkstra",
    "`"The computer was born to solve problems that did not exist before.`"`nBill Gates",
    "`"Always code as if the guy who ends up maintaning your code will be a violent psychopath who knows where you live.`"`nRick Osborne",
    "`"People don't care about what you say, they care about what you build.`"`nMark Zuckerberg",
    "`"We have to stop optimizing for programmers and start optimizing for users.`"`nJeff Atwood",
    "`"If the code and the comments do not match, possibly both are incorrect.`"`nNorm Schryer",
    "`"Bad programmers worry about the code. Good programmers worry about data structures and their relationships.`"`nLinus Torvalds",
    "`"If you optimize everything, you will always be unhappy.`"`nDonald Knuth",
    "`"Your mind is programmable - if you're not programming your mind, else will program it for you.`"`nJeremy Hammond",
    "`"The trouble with programmers is that you can never tell what a programmer is doing until it's too late.`"`n	Seymour Cray",
    "`"Debugging becomes significantly easier if you first admit that you are the problem.`"`nWilliam Laeder",
    "`"Talk is cheap.Show me the code.`"`nLinus Torvalds",
    "`"Everybody in this country should learn to program a computer because it teaches you how to think.`"`nSteve Jobs",
    "`"Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.`"`nRajanand",
    "`"Any fool can write code that a computer can understand.Good programmers write code that humans can understand.`"`nMartin Fowler",
    "`"First, solve the problem.Then write the code.`"`nJohn Johnson",
    "`"The function of a good software is to make the complex appear to be simple.`"`nGrady Booch",
    "`"Your most unhappy customers are your greatest source of learning.`"`nBill Gates",
    "`"Small minds are concerned with the extraordinary, great minds with the ordinary.`"`nBlaise Pascal",
    "`"Everyday life is like programming, I guess.If you love something you can put beauty on it.`"`nDonald Knuth",
    "`"As a programmer, it is your job to put yourself out of business. What you do today can be automated tomorrow.`"`nDoug McIlroy",
    "`"A good programmer is someone who always looks both ways before crossing a one-way street.`"`nDoug Linder",
    "`"Testing can only prove the presence of bugs, not their absence.`"`nEdsger W. Dijkstra",
    "`"Experience is the name everyone gives to their mistakes.`"`nOscar Wilde",
    "`"Code is like humor. When you have to explain it, it’s bad.`"`nCory House",
    "`"Fix the cause, not the symptom.`"`nSteve Maguire",
    "`"Before software can be reusable it first has to be usable.`"`nRalph Johnson",
    "`"Make it work, make it right, make it fast.`"`nKent Beck",
    "`"There is a big difference between making a simple product & making a product simple.`"`nDes Traynor",
    "`"In programming, the hard part isn't solving problems, but deciding what problems to solve.`"`nPaul Graham",
    "`"No one in the brief history of computing has ever written a piece of perfect software. It's unlikely that you'll be the first.`"`nAndy Hunt",
    "`"Give someone a program, you frustrate them for a day; teach them how to program, you frustrate them for a lifetime`"`nDavid Leinweber",
    ]
; TODO: add:
; Dont't worry if it doesn't work right. If everything did, you'd be out of a job. Mosher’s Law of Software Engineering
; Without requirements or design, programming is the art of adding bugs to an empty text file. Louis Srygley
; Walking on water and developing software from a specification are easy if both are frozen. Edward V. Berard
; One man’s crappy software is another man’s full-time job. (Jessica Gaston)
; The best thing about a boolean is even if you are wrong, you are only off by a bit. (Anonymous)
; Without requirements or design, programming is the art of adding bugs to an empty text file. (Louis Srygley)
; Developer is an organism that turns coffee into code.
; The purpose of software engineering is to control complexity, not to create it.
; It’s not a bug – it’s an undocumented feature. (Anonymous)
; A good programmer is someone who always looks both ways before crossing a one-way street. (Doug Linder)
; Deleted code is debugged code. (Jeff Sickel)
    ; TrayTip(quotes[Random(1,41)], "Quote of the Day")
    ; msgbox(quotes[Random(1,41)],"Quotes", 1)
    return quotes[Random(1,41)]
}