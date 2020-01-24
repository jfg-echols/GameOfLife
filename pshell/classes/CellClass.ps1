class Cell {
    [bool] $alive
    [int] $xcoord
    [int] $ycoord
    [int] $neighbourCount
    
    #constructor
    Cell () {

    }
    #TODO - for some reason this didn't work?
    # Cell ($x,$y) {
    #     $this.xcoord = $x
    #     $this.ycoord = $y
    # }

    #probably don't need this as i can just get the value
    [bool] isAlive () {
        return $this.alive
    
    }
    [void] setLive ($living) {
        $this.alive = $living
    }

    [void] setXCoord ($x) {
        $this.xcoord = $x
    }
    [void] setYCoord ($y) {
        $this.ycoord = $y
    }
    #TODO - turn this into a function not run in the game class
    # [string] display () {
    #     if ($this.alive) {
    #         return 'O'
    #     } else {
    #         return 'X'
    #     }
    # }

    [void] displayOutput () {
        if ($this.alive) {
            write-host 'O'
        } else {
            write-host 'X'
        }
    }
    [void] countNeighbours ([hashtable] $gameboard) {
        # write-host -f cyan "counting neighbours for y:$($this.ycoord) x:$($this.xcoord)"
        ##TODO - get rid of these variables
        $height = $gameboard.Count
        $width = $gameboard[0].count
        $neighbours = 0
        <#
        NOTES: 
        1) Y AXIS IS REVERSED ON OUTPUT - SEE RESULTS OF GAME.printCellPositions()
        2) When calling positions against board hashtable, calls Y position first
        Entries in the Hashtable (y axis) hold arrays (x axis)
        #>
        
        #top row
        if ($this.ycoord -ge 1) {
            if ($this.xcoord -ge 1) {
                if ($gameboard[$this.ycoord-1][$this.xcoord-1].isalive()) {
                    $neighbours += 1
                }
            }
            if ($gameboard[$this.ycoord-1][$this.xcoord].isalive()) {
                $neighbours += 1
            }
            if ($this.xcoord -lt ($width-1)) {
                if ($gameboard[$this.ycoord-1][$this.xcoord+1].isalive()) {
                    $neighbours += 1
                }
            }
        }
        if ($this.xcoord -ge 1) {
            if ($gameboard[$this.ycoord][$this.xcoord-1].isalive()) {
                $neighbours += 1
            }
        }
        if ($this.xcoord -lt ($width-1)) {
            if ($gameboard[$this.ycoord][$this.xcoord+1].isalive()) {
                $neighbours += 1
            }
        }
        if ($this.ycoord -lt ($height-1)) {
            if ($this.xcoord -ge 1) {
                if ($gameboard[$this.ycoord+1][$this.xcoord-1].isalive()) {
                    $neighbours += 1
                }
            }
            if ($gameboard[$this.ycoord+1][$this.xcoord].isalive()) {
                $neighbours += 1
            }
            if ($this.xcoord -lt ($width-1)) {
                if ($gameboard[$this.ycoord+1][$this.xcoord+1].isalive()) {
                    $neighbours += 1
                }
            }
        }
        $this.neighbourCount = $neighbours
    }
    [void] populateCell () {
        <#
        The Rules
        For a space that is 'populated':
            Each cell with one or no neighbors dies, as if by solitude.
            Each cell with four or more neighbors dies, as if by overpopulation.
            Each cell with two or three neighbors survives.
        For a space that is 'empty' or 'unpopulated'
            Each cell with three neighbors becomes populated.
        #>
        if ($this.alive) {
            if ($this.neighbourCount -le 1) {
                $this.alive = $false
            } elseif ($this.neighbourCount -ge 4) {
                $this.alive = $false
            }
        } else {
            if ($this.neighbourCount -eq 3) {
                $this.alive = $true
            }
        }
    }   
}