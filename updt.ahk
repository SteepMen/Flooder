updurl := "https://github.com/SteepMen/Flooder/raw/master/TestSuite.ahk"
SplashTextOn, , 60,��������������, ����������. ��������..`n����������� ������� ����������.
RegRead, put2, HKEY_CURRENT_USER, SoftWare\SAMP, put2
sleep, 5000
SplashTextOn, , 60,��������������, ����������. ��������..`n��������� ����������� ������.
URLDownloadToFile, %updurl%, %put2%
SplashTextOn, , 60,��������������, ����������. ��������..`n��������� ����������� ������.
sleep, 3000
Run, % put2
ExitApp