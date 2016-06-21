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