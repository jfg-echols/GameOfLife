. .\CellClass.ps1
. .\GameClass.ps1


$xvalue = 25
$yvalue = 25
# $xvalue = read-host "input number of columns:"
# $yvalue = read-host "input number of rows:"

$thisgame = [LifeGame]::new($xvalue,$yvalue)

$thisgame.newBoard()
$thisgame.seedBoard()



do {
    # $input = read-host "for next turn press [space] - any other key to end"
    # cls
    $thisgame.printBoard()
    $thisgame.turn += 1
    start-sleep -seconds 1
} until ($thisgame.turn -eq 30)


# $thisgame.board[3][3].setLive($true)
# $thisgame.printBoard()
#$thisgame.board.count
# $thisgame.basicPrint()