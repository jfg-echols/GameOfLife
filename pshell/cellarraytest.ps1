. .\CellClass.ps1

# if ($thiscell.isAlive()) {
#     write-host "O"
# } else {
#     write-host "X"
# }

# $thisCell.setLive($true)

# if ($thiscell.isAlive()) {
#     write-host "O"
# } else {
#     write-host "X"
# }

$testarray = @()
for ($i=0; $i -lt 10; $i+=1) {

    $thisCell = [Cell]::new()
    if ($i % 2 -eq 0) {
        $thisCell.setLive($false)
    } else {
        $thisCell.setLive($true)
    }
    
    $testarray += $thisCell
}

# foreach ($cell in $testarray) {
#     $live = $cell.isAlive()
#     write-host $live
#     # $cell.displayOutput()
# }

write-host $($testarray[4].isAlive())