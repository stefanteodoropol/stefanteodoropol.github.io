$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path D:\a\1\a\output.txt -append
# Do some stuff

$source = Get-Location
$exclude = @('CNAME','README.md','deploy.ps1')
Get-ChildItem $source -Recurse -Container -Exclude $exclude | Copy-Item -Destination D:\a\1\a\deploy

dir | ECHO

cd D:\a\1\a

dir | ECHO

cd D:\a\1\a\deploy

dir | ECHO

# End doing stuff
Stop-Transcript