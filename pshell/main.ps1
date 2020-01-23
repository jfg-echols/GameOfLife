. .\CellClass.ps1
. .\GameClass.ps1


$xvalue = 25
$yvalue = 25
# $xvalue = read-host "input number of columns:"
# $yvalue = read-host "input number of rows:"

$thisgame = [LifeGame]::new($xvalue,$yvalue)

$thisgame.newBoard()

#getting cell numbers
#$thisgame.printCellPositions()

$thisgame.seedBoard()
#TODO - turn becomes its own class?
do {
    # cls
    $thisgame.printBoard()
    $thisgame.updateAllCellNeighbourCounts()
    $thisgame.printAllCellNeighbourCounts() 
    $thisgame.turn += 1
    # start-sleep -seconds 1
    $input = read-host "for next turn press [space] - any other key to end"
} until ($thisgame.turn -eq 30)


