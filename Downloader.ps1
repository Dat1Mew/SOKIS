Echo "Checking for an existing .bak!"
$bakcheck = test-path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe.bak"

if ($bakcheck -like "True") {
echo ".bak found!"
remove-item -path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe.bak"
echo ".bak removed!"
} else {
echo "No .Bak! Ignoring!"
}

echo "Renaming old OculusDash!"
Rename-Item -Path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe" -NewName "OculusDash.exe.bak"

echo "Checking for it's existence!"
$bakcheck = test-path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe.bak"

if ($bakcheck -like "True") {
echo ".bak found!"
} else {
echo "No .Bak! Please restart the application!"
exit
}

cd "C:\Program Files\Oculus\Support\oculus-dash\dash\bin"
echo "Downloading Oculus Killer!"
Invoke-WebRequest -Uri https://github.com/BnuuySolutions/OculusKiller/releases/download/v1.3.0/OculusDash.exe -OutFile .\OculusDash.exe

echo "Checking if the file actually there."
$execheck = test-path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe"

if ($execheck -like "True") {
echo ".exe found!"
} else {
echo "SHITS FUCKED! Please restart the application!"
exit
}


echo "OculusDash Updated and Replaced! <3"

timeout /t 5