# ToggleAudio

Changes default audio device between any two devices - $defaultdevice1 and $defaultdevice2

## Setup

1. Install nircmd - https://nircmd.nirsoft.net/

2. Clone repo down to your home directory

3. In ToggleAudio.ps1, change $defaultdevice1 and $defaultdevice2 to the devices you want to switch between

4. In hidden.vbs, change command =  to contain your machine's path

5. Right click properties on toggleaudio.lnk, edit target to contain your machine's path 

6. Still in properties of toggleaudio.lnk set a hotkey, I used ctrl + alt + home.

7. Place shortcut on desktop (will not work from anywhere else), happy audio toggling :)

Credit: https://stackoverflow.com/questions/59393574/how-to-identify-the-default-audio-device-in-powershell
