$dir = "C:\dev\powershell"

Write-Host "dir: " $dir

Select-String $dir\*.txt -pattern "This is my line"