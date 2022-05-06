#Author: rcfromcle
#Date: 5/6/2022
#toggles between the two audio devices -  $defaultdevice1 & $defaultdevice2
#script requires nircmd be installed - https://nircmd.nirsoft.net/

Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;
[Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice {
    int a(); int o();
    int GetId([MarshalAs(UnmanagedType.LPWStr)] out string id);
}
[Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator {
    int f();
    int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice endpoint);
}
[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")] class MMDeviceEnumeratorComObject { }
public class Audio {
    public static string GetDefault (int direction) {
    var enumerator = new MMDeviceEnumeratorComObject() as IMMDeviceEnumerator;
    IMMDevice dev = null;
    Marshal.ThrowExceptionForHR(enumerator.GetDefaultAudioEndpoint(direction, 1, out dev));
    string id = null;
    Marshal.ThrowExceptionForHR(dev.GetId(out id));
    return id;
    }
}
'@

$defaultdevice1 = "Digital Output" 
$defaultdevice2 = "Speakers"

function getFriendlyName($id) {
    $reg = "HKLM:\SYSTEM\CurrentControlSet\Enum\SWD\MMDEVAPI\$id"
    return (get-ItemProperty $reg).FriendlyName
}

$id0 = [audio]::GetDefault(0)
$(getFriendlyName $id0)

if ($(getFriendlyName $id0) -like "Speakers (Focusrite Usb Audio)") {
    nircmd beep 250 750
    nircmd speak text "changing audio device..." 1 50 
    Start-Sleep 2
    nircmd setdefaultsounddevice $defaultdevice1
    nircmd beep 800 525
}
else {
    nircmd beep 250 750
    nircmd speak text "changing audio device" 1 50
    Start-Sleep 2 
    nircmd setdefaultsounddevice $defaultdevice2
    nircmd beep 800 525
}


