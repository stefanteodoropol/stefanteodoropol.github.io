# Author: Stefan Teodoropol
# Date: 26.02.2021
# Version: 1.0
# 
# Description:
# This code is ment to be run on a windows azure dev ops worker instance.
# It is part of the deploy pipeline.
# The desired result is a folder containing all files and folders necessary for the website to function in the artifacts

# To begin, console output is redirected to a file, the location is the azure worker folder where it will look for build artifacts. (D:\a\1\a\)
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path D:\a\1\a\output.txt -append
# Do some stuff.

# Exclude files not ment to be deployed. Can also specify folder paths etc and you can use a wildcard '*'.
$exclude = @('CNAME','README.md','deploy.ps1')
$source = Get-Location
$target = "D:\a\1\a\deploy"

# Copy all files in the repository root except the excluded ones.
Copy-Item -Path $source\* -Destination $target -Verbose -Exclude $exclude

# Create \images folder in the folder to be deployed
New-Item -ItemType directory -Path $target\images

# Copy all images in the \images folder.
Copy-Item -Path $source\images\* -Destination $target\images -Verbose -Exclude $exclude

# Check current directory. Should be D:\a\1\s and it should be a fresh clone of a desired repository branch (master or dev usually).
# Set the repository to use with the azure worker in the online pipeline configurator in your project at (http://dev.azure.com/)
dir | ECHO

# Change to folder containing artifacts.
cd D:\a\1\a

# Check artifacts folder. Should contain a deploy folder and the output.txt file containing the console transcript.
dir | ECHO

# Change to folder to be deployed. 
cd D:\a\1\a\deploy

# Check deploy folder. Should contain your website files excluding anything not needed for the site in your repository.
dir | ECHO

# End doing stuff
Stop-Transcript