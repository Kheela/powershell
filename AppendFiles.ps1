$dir = "C:\dev\powershell\"
$outputFile = $dir + "output.txt"
$today = (Get-Date).Date
$tomorow = (Get-Date).AddDays(1).Date

Write-Host "dir: " $dir
Write-Host "today: " $today
Write-Host "tomorow: " $tomorow

function Select-TodaysFiles () {
    $txtFiles = @()
    
    ls -Path $dir -Filter file*.txt | `
        Where {$_.LastWriteTime -gt $today -and $_.LastWriteTime -lt $tomorow} | `
        % { #ForEach
            $content = Get-Content $_.FullName
            $line = $content# + "`n"
            $txtFiles += ,$line
        }

    return ,$txtFiles
}

Select-TodaysFiles | % { Write-Output $_ }
Select-TodaysFiles | % { 
    $_ >> $outputFile 
}

$outputContent = Get-Content $outputFile
Write-Host $outputContent
