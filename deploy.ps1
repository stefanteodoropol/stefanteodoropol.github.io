$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path D:\a\1\a\output.txt -append
# Do some stuff

$exclude = @('CNAME','README.md','deploy.ps1')
$source = Get-Location
$target = "D:\a\1\a\deploy"

Copy-Item -Path $source\* -Destination $target -Verbose -Exclude $exclude
New-Item -ItemType directory -Path $target\images
Copy-Item -Path $source\images\* -Destination $target\images -Verbose -Exclude $exclude 

dir | ECHO

cd D:\a\1\a

dir | ECHO

cd D:\a\1\a\deploy

dir | ECHO


# End doing stuff
Stop-Transcript