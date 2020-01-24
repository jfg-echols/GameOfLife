. .\classes\CellClass.ps1
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
                #TODO - want to use a constructor with the variables, but it won't work for some reason
                [Cell] $thisCell = [Cell]::new()
                $thisCell.setLive($false)
                $thisCell.setXCoord($colcount)
                $thisCell.setYCoord($boardRow)
                $boardColumnsArray += $thisCell
            }
            $boardRowsArray[$boardRow] = $boardColumnsArray     
        }
        $this.board = $boardRowsArray
    }
    
    [void] newRandomBoard () {
        $height = $this.yvalue
        $length = $this.xvalue
        $boardRowsArray = @{}
        for ($boardRow=0;$boardRow -lt $height; $boardRow+=1) {
            $boardColumnsArray = @()
            for ($colcount=0; $colcount -lt $length; $colcount+=1) {
                #TODO - want to use a constructor with the variables, but it won't work for some reason
                [Cell] $thisCell = [Cell]::new()
                $rand = Get-Random -Maximum 2
                if ($rand -eq 1) {
                    $thisCell.setLive($false)
                } else {
                    $thisCell.setLive($true)
                }
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
        $display = "{0:00}" -f $this.turn
        write-host "turn: $display"
        for ($boardRow=0;$boardRow -lt ($this.board.Count);$boardRow+=1) {
            $printcolumnarray = @()
            foreach ($cellInRow in ($this.board[$boardRow])) {
                if ($cellInRow.isAlive()) {
                    $printcolumnarray += "O"
                } else {
                    $printcolumnarray += " "
                }
            }
            write-host "|$($printcolumnarray -join ' ')|"
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
        for ($boardRow=0; $boardRow -lt ($this.board.Count); $boardRow+=1) {
            $printcolumnarray = @()
            foreach ($cellInRow in ($this.board[$boardRow])) {
                $printcolumnarray += "[$($cellInRow.neighbourCount)]"
            }
            write-host $($printcolumnarray -join '')
        }
    }
    [void] updateAllCellNeighbourCounts () {
        for ($boardRow=0; $boardRow -lt ($this.board.Count); $boardRow+=1) {
            foreach ($cellInRow in ($this.board[$boardRow])) {
                $cellInRow.countNeighbours($this.board)
            }
        }
    }
    [void] updateAllCellPopulations () {
        for ($boardRow=0; $boardRow -lt ($this.board.Count); $boardRow+=1) {
            foreach ($cellInRow in ($this.board[$boardRow])) {
                $cellInRow.populateCell()
            }
        }
    }

    [string] basicPrint () {
        return "game created with $($this.yvalue) rows and $($this.xvalue) columns"
    }
}