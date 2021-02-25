$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path D:\a\1\a\output.txt -append
# Do some stuff

$exclude = @('CNAME','README.md','deploy.ps1')
Copy-Item .\* -Destination D:\a\1\a\deploy\ -Recurse -Exclude $exclude

dir | ECHO

cd D:\a\1\a

dir | ECHO

cd D:\a\1\a\deploy

dir | ECHO

# End doing stuff
Stop-Transcript