. .\classes\CellClass.ps1
. .\classes\GameClass.ps1


# $xvalue = 25
# $yvalue = 25
$xvalue = read-host "input number of columns:"
$yvalue = read-host "input number of rows:"
$turncount = read-host "number of turns you want this for"

$thisgame = [LifeGame]::new($xvalue,$yvalue)

$thisgame.newRandomBoard()
#getting cell numbers
#$thisgame.printCellPositions()
$thisgame.seedBoard()
write-host -f green "BOARD CREATED AND SEEDED"
#TODO - turn becomes its own class?
do {
    cls
    $thisgame.printBoard()
    $thisgame.updateAllCellNeighbourCounts()
    # $thisgame.printAllCellNeighbourCounts()
    $thisgame.updateAllCellPopulations() 
    $thisgame.turn += 1
    start-sleep -Milliseconds 100
    # $input = read-host "for next turn press [space] - any other key to end"
} until ($thisgame.turn -eq $turncount)


