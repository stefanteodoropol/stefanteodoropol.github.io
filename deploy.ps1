$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path D:\a\1\a\output.txt -append
# Do some stuff

dir | ECHO

Remove-Item .\deploy -Recurse
New-Item -ItemType directory -Path .\deploy\
$source = Get-Location
$dest = Join-Path -Path $source -ChildPath "\deploy"
$exclude = @('CNAME','README.md','deploy.ps1')
Get-ChildItem $source -Recurse -Exclude $exclude | Copy-Item -Destination {Join-Path $dest $_.FullName.Substring($source.length)}

# End doing stuff
Stop-Transcript


