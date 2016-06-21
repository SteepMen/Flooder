buildscr = 2 ;версия для сравнения, если меньше чем в verlen.ini - обновляем
downlurl := "https://github.com/SteepMen/Flooder/raw/master/updt.ahk"
downllen := "https://github.com/SteepMen/Flooder/raw/master/verlen.ini"

Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
    If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
        BOM = 3
    Else
        BOM = 0

    UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
                    , "UInt", &Utf8String + BOM, "Int", -1
                    , "Int", 0, "Int", 0)
    VarSetCapacity(UniBuf, UniSize * 2)
    DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
                    , "UInt", &Utf8String + BOM, "Int", -1
                    , "UInt", &UniBuf, "Int", UniSize)

    AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
                    , "UInt", &UniBuf, "Int", -1
                    , "Int", 0, "Int", 0
                    , "Int", 0, "Int", 0)
    VarSetCapacity(AnsiString, AnsiSize)
    DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
                    , "UInt", &UniBuf, "Int", -1
                    , "Str", AnsiString, "Int", AnsiSize
                    , "Int", 0, "Int", 0)
    Return AnsiString
}
WM_HELP(){
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi(updupd)
    msgbox, , Список изменений версии %vupd%, %updupd%
    return
}

OnMessage(0x53, "WM_HELP")
Gui +OwnDialogs

SplashTextOn, , 60,Автообновление, Запуск скрипта. Ожидайте..`nПроверяем наличие обновлений.
URLDownloadToFile, %downllen%, %a_temp%/verlen.ini
IniRead, buildupd, %a_temp%/verlen.ini, UPD, build
if buildupd =
{
    SplashTextOn, , 60,Автообновление, Запуск скрипта. Ожидайте..`nОшибка. Нет связи с сервером.
    sleep, 2000
}
if buildupd > % buildscr
{
    IniRead, vupd, %a_temp%/verlen.ini, UPD, v
    SplashTextOn, , 60,Автообновление, Запуск скрипта. Ожидайте..`nОбнаружено обновление до версии %vupd%!
    sleep, 2000
    IniRead, desupd, %a_temp%/verlen.ini, UPD, des
    desupd := Utf8ToAnsi(desupd)
    IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
    updupd := Utf8ToAnsi(updupd)
    SplashTextoff
    msgbox, 16384, Обновление скрипта до версии %vupd%, %desupd%
    IfMsgBox OK
    {
        msgbox, 1, Обновление скрипта до версии %vupd%, Хотите ли Вы обновиться?
        IfMsgBox OK
        {
            put2 := % A_ScriptFullPath
            RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP ,put2 , % put2
            SplashTextOn, , 60,Автообновление, Обновление. Ожидайте..`nОбновляем скрипт до версии %vupd%!
            URLDownloadToFile, %downlurl%, %a_temp%/updt.exe
            sleep, 1000
            run, %a_temp%/updt.exe
            exitapp
        }
    }
}
SplashTextoff
Gui, Font, S19 C000033 Bold, Times New Roman 
Gui, Add, Text, x12 y0 w190 h30 vMyText +Center, Flooder
Gui, Font, S17 C006666 Bold, Times New Roman 
Gui, Font, S10 C006666 Bold, Times New Roman 
Gui, Add, Button, x12 y190 w190 h30 , Закрыть 
Gui, Add, Button, x12 y150 w190 h30 , Информация 
Gui, Show, x803 y312 h240 w223, Флудер от Steep
Return 
ButtonЗакрыть: 
ExitApp 
Return 
ButtonПроверкаобновления: 
run, http://cheat-master.ru/forum/150-304572 
Return 
ButtonИнформация: 
MsgBox,, FLOODER, XZ как включать
Return 
GuiClose: 
ExitApp 
F12:: exitapp 
F3:: reload 
F2:: 
SelectedFile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt 
start3: 
Loop, Read, %SelectedFile% 
{ 
IfInString, A_LoopReadLine, _________===[КЛИЕНТ БАНКА SA]===_________
{ 
Goto, start5 
} 
} 
goto, start3 
start5: 
filedelete, %SelectedFile% 
fileappend, , %SelectedFile% 
loop 5 
{ 
sendinput, {F6}/bizwar 1{enter}
Enter:
sleep 1100 
} 
return