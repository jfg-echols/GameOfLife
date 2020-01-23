. .\CellClass.ps1
class LifeGame {
    [int] $xvalue
    [int] $yvalue
    [int] $turn
    [hashtable]$board

    LifeGame ([int] $x, [int] $y) {
        $this.xvalue = $x
        $this.yvalue = $y
        $this.turn = 0
    }

    [void] newBoard () {
        $height = $this.yvalue
        $length = $this.xvalue
        $boardRowsArray = @{}
        for ($boardRow=0;$boardRow -lt $height; $boardRow+=1) {

            $boardColumnsArray = @()
            
            for ($colcount=0; $colcount -lt $length; $colcount+=1) {
                #want to use a constructor with the variables, but it won't work for some reason
                [Cell] $thisCell = [Cell]::new()
                $thisCell.setLive($false)
                # write-host $($thisCell.isAlive())
                $thisCell.setXCoord($colcount)
                $thisCell.setYCoord($boardRow)
                $boardColumnsArray += $thisCell
            }
            $boardRowsArray[$boardRow] = $boardColumnsArray     
        }
        $this.board = $boardRowsArray
    }

    [void] seedBoard () {
        <# seeding as glider structure
        -O-
        --O
        OOO
        #>
        $this.board[0][1].setLive($true)    
        $this.board[1][2].setLive($true)
        $this.board[2][0].setLive($true)
        $this.board[2][1].setLive($true)
        $this.board[2][2].setLive($true)
    }

    [void] printBoard () {
        write-host ":::::::::: $($this.turn) ::::::::::"
        for ($boardRow=0;$boardRow -lt ($this.board.Count);$boardRow+=1) {
            $printcolumnarray = @()
            foreach ($cellInRow in ($this.board[$boardRow])) {
                if ($cellInRow.isAlive()) {
                    $printcolumnarray += "O"
                } else {
                    $printcolumnarray += "-"
                }
            }

            write-host $($printcolumnarray -join ' ')
        }
    }

    [void] printCellPositions () {
        for ($boardRow=0; $boardRow -lt ($this.board.Count); $boardRow+=1) {
            $printcolumnarray = @()
            foreach ($cellInRow in ($this.board[$boardRow])) {
                $printcolumnarray += "[$($cellInRow.xcoord),$($cellInRow.ycoord)]"
            }
            write-host $($printcolumnarray -join '')
        }
    }
    [void] printAllCellNeighbourCounts () {
        write-host "printcellneighbours"
        for ($boardRow=0; $boardRow -lt ($this.board.Count); $boardRow+=1) {
            $printcolumnarray = @()
            foreach ($cellInRow in ($this.board[$boardRow])) {
                $printcolumnarray += "[$($cellInRow.neighbourCount)]"
            }
            write-host $($printcolumnarray -join '')
        }
    }
    [void] updateAllCellNeighbourCounts () {
        write-host "update cell neighbours"
        for ($boardRow=0; $boardRow -lt ($this.board.Count); $boardRow+=1) {
            $printcolumnarray = @()
            foreach ($cellInRow in ($this.board[$boardRow])) {
                $cellInRow.countNeighbours($this.board)
            }
        }
    }

    

    [string] basicPrint () {
        # write-host "game created with " -nonewline
        # write-host -f yellow $($this.yvalue) -NoNewline
        # write-host "rows and " -nonewline
        # write-host -f yellow $($this.xvalue) -nonewline 
        # write-host "columns"
        return "game created with $($this.yvalue) rows and $($this.xvalue) columns"
    }
}