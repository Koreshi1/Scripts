;=======GLOBAL=======
#NoEnv
#Warn
#SingleInstance Force
#IfWinActive, Tibia
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SendMode Input


SetTimer, AutoHealing, On

AutoHeal := 1
Auto_SSA_e_Might := 0
Auto_Hur_e_Paralyze := 0
Auto_Manashield := 0

;HP Information
ColorHealth := 0xC04040
HealthY := 307
UseHealWeakX := 1846
UseHealStrongX := 1790

;MP Information
UseManaPotionX := 1838
ManaY := 322
ManaColor := 0x6562F0

;End AutoExecute
return


;=======HOTKEYS=======
Home::
	If (AutoHeal == 0)
	{
		AutoHeal := 1
		Send, !{F8}
		SetTimer, AutoHealing, On
	}
	else
	{
		AutoHeal := 0
		Send, !{F8}
		SetTimer, AutoHealing, Off
	}
return

Ins::
	If (Auto_Manashield == 0)
	{
		Auto_Manashield := 1
		SetTimer, AutoManaShield, On
	}
	else
	{
		Auto_Manashield := 0
		SetTimer, AutoManaShield, Off
	}
return


End::
	If (Auto_SSA_e_Might == 0)
	{
		Auto_SSA_e_Might := 1
		SetTimer, AutoSSA&Might, On
	}
	else
	{
		Auto_SSA_e_Might := 0
		SetTimer, AutoSSA&Might, Off
	}
return



Del::
	If (Auto_Hur_e_Paralyze == 0)
	{
		Auto_Hur_e_Paralyze := 1
		SetTimer, AutoHureLyze, On
	}
	else
	{
		Auto_Hur_e_Paralyze := 0
		SetTimer, AutoHureLyze, Off
	}
return


+1::        ;Shift+1  PUXMAX XPOSITION
	
	MouseGetPos, StartX, StartY
	Click D
	Click u 1595, 62
	MouseMove, %StartX%, %StartY%
	Random, rand, 100, 500
	sleep %rand%
return


+2::        ;Shift+2  Flower DROP XPOSITION
	MouseGetPos, XFlower, YFlower
	Click D 1595, 118
	Click u %XFlower%, %YFlower%
	Random, rand, 100, 500
	sleep %rand%
return


;=======LABELS=======
AutoHealing:
If WinActive("ahk_class Qt5QWindowOwnDCIcon")
{
	Pixelgetcolor, HealWeak, %UseHealWeakX%, %HealthY%, Fast RGB
	Sleep, 20
	Pixelgetcolor, HealStrong, %UseHealStrongX%, %HealthY%, Fast RGB
	Sleep, 20
	Pixelgetcolor, HealMana, %UseManaPotionX%, %ManaY%, Fast RGB
	Sleep, 20
	if (HealWeak != ColorHealth && HealStrong == ColorHealth && HealMana == ManaColor)
	{
		Random, rand, 100, 400
		sleep %rand%
		Send, {F2}
		KeyWait, F2
		return
	}
	Sleep, 20
	if (HealWeak != ColorHealth && HealStrong != ColorHealth && HealMana == ManaColor)
	{
		Random, rand, 100, 200
		sleep %rand%
		Send, {F1}
		KeyWait, F1
		return
	}
	Sleep, 20
	if (HealMana != ManaColor)
	{
		Random, rand, 200, 500
		sleep %rand%
		Send, {F3}
		KeyWait, F3
		return
	}
}
return




AutoSSA&Might:
If WinActive("ahk_class Qt5QWindowOwnDCIcon")
{
	ImageSearch, SSAx, SSAy, 1738, 143, 1801, 269, C:\Users\px\Desktop\$\autossa_and_might-master\PNG\SSA1.png
	If ErrorLevel = 1
	{
		Send, {F12}
		KeyWait, F12
		Random, rand, 100, 500
		sleep %rand%
	}
	ImageSearch, MightX, MightY, 1738, 143, 1801, 269, C:\Users\px\Desktop\$\autossa_and_might-master\PNG\MightRing1.png
	If ErrorLevel = 1
	{
		Send, {F11}
		KeyWait, F11
		Random, rand, 100, 500
		sleep %rand%
	}
	Sleep 100
}
return



AutoHureLyze:
If WinActive("ahk_class Qt5QWindowOwnDCIcon")
{
	ImageSearch, HurX, HurY, 1749, 280, 1861, 302, *50, C:\Users\px\Desktop\$\autossa_and_might-master\PNG\Hur.png
	If ErrorLevel = 1
	{
		Random, rand, 100, 500
		sleep %rand%
		Send, {F7}
		KeyWait, F7
	}
	ImageSearch, LyzeX, LyzeY, 1749, 280, 1861, 302, *50, C:\Users\px\Desktop\$\autossa_and_might-master\PNG\paralyze.png
	If ErrorLevel = 0
	{
		Random, rand, 400, 1000
		sleep %rand%
		Send, {F8}
		KeyWait, F8
	}
}
return



AutoManaShield:
If WinActive("ahk_class Qt5QWindowOwnDCIcon")
{
	ImageSearch, ManaShieldX, ManaShieldY, 1749, 280, 1861, 302, *50, C:\Users\px\Desktop\$\autossa_and_might-master\PNG\utamovita.png
	If ErrorLevel = 1
	{
		Random, rand, 100, 400
		sleep %rand%
		Send, {F4}
		KeyWait, F4
		sleep, 50
	}
}
return