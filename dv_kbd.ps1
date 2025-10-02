# dv_kbd.ps1

$methodtip = "040C:19360409"
$dll_file = "C:\Windows\System32\kbddvp.dll"
if (!(Test-Path $dll_file)) {
	wget -outf kbddvp.exe https://www.kaufmann.no/downloads/winnt/kbddvp-1_2_8-i386.exe
	.\kbddvp.exe
	$kbddvp_proc = (Get-Process kbddvp).Id
	Wait-process -Id $kbddvp_proc

	rm ./kbddvp.exe
}
$inputmethod = Get-WinUserLanguageList
if (!((Get-WinUserLanguageList)[0].InputMethodTips | findstr $methodtip)) {
	echo "adding dvorak"
	$inputmethod[0].InputMethodTips.Add('040C:19360409')
	Set-WinUserLanguageList $inputmethod -force
}
else {
	echo "removing dvorak"
	$inputmethod[0].InputMethodTips.Remove('040C:19360409')
	Set-WinUserLanguageList $inputmethod -force
}