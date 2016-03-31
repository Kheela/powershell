$dir = "C:\dev\powershell"
$today = (Get-Date).Date
$tomorow = (Get-Date).AddDays(1).Date

Write-Host "dir: " $dir
Write-Host "today: " $today
Write-Host "tomorow: " $tomorow

#$txtFiles = 
ls -Path $dir -Filter *.txt | `
    Where-Object {$_.LastWriteTime -gt $today -and $_.LastWriteTime -lt $tomorow} | `
    ForEach-Object {
        $content = Get-Content $_.FullName
        Write-Host $content
    }
