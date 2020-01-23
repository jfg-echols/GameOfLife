. .\CellClass.ps1
class LifeGame {
    [int] $xvalue
    [int] $yvalue
    [int] $turn
    $board

    LifeGame ([int] $x, [int] $y) {
        $this.xvalue = $x
        $this.yvalue = $y
        $this.turn = 0
    }

    [void] newBoard () {
        $height = $this.yvalue
        $length = $this.xvalue
        $boardRowsArray = @{}
        for ($rowcount=0;$rowcount -lt $height; $rowcount+=1) {

            $boardColumnsArray = @()
            
            for ($colcount=0; $colcount -lt $length; $colcount+=1) {
                [Cell] $thisCell = [Cell]::new()
                $thisCell.setLive($false)
                # write-host $($thisCell.isAlive())
                $thisCell.setXCoord($colcount)
                $thisCell.setYCoord($rowcount)
                $boardColumnsArray += $thisCell
            }
            $boardRowsArray[$rowcount] = $boardColumnsArray     
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
        # $printRowArray = @()
        
        # write-host "$($this.board.Count)" -f Green
        write-host ":::::::::: $($this.turn) ::::::::::"
        for ($rowcount=0;$rowcount -lt ($this.board.Count);$rowcount+=1) {
            # write-host "new Row $rowcount" -f Cyan
            $printcolumnarray = @()
            foreach ($column in ($this.board[$rowcount])) {

                # write-host "column"
                if ($column.isAlive()) {
                    $printcolumnarray += "O"
                } else {
                    $printcolumnarray += "-"
                }
            }

            write-host $($printcolumnarray -join ' ')
        }
    }

    [void] updateBoard () {
        #should be doing this in the cell class with x y coords

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