command = "powershell.exe -nologo -ExecutionPolicy Unrestricted -File C:\Users\Rudy\ToggleAudio\ToggleAudio.ps1"
 
set shell = CreateObject("WScript.Shell")
 
shell.Run command,0