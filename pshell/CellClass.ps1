class Cell {
    [bool] $alive
    [int] $xcoord
    [int] $ycoord
    [int] $neighbourCount
    
    #constructor
    Cell () {

    }
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
            #topleft -1,-1
            if ($this.xcoord -ge 1) {
                if ($gameboard[$this.ycoord-1][$this.xcoord-1].isalive()) {
                    $neighbours += 1
                }
            }
            #topmid 0,-1
            if ($gameboard[$this.ycoord-1][$this.xcoord].isalive()) {
                $neighbours += 1
            }
            #topright 1,-1
            if ($this.xcoord -le ($width-1)) {
                if ($gameboard[$this.ycoord-1][$this.xcoord+1].isalive()) {
                    $neighbours += 1
                }
            }
        }
        #middle row
        #midleft -1,0
        if ($this.xcoord -ge 1) {
            if ($gameboard[$this.ycoord][$this.xcoord-1].isalive()) {
                $neighbours += 1
            }
        }
        #midright 1,0
        if ($this.xcoord -le ($width-1)) {
            if ($gameboard[$this.ycoord][$this.xcoord+1].isalive()) {
                $neighbours += 1
            }
        }
        
        #bottom row
        if ($this.ycoord -le ($height-1)) {
            #mottomleft -1,1
            if ($this.xcoord -ge 1) {
                if ($gameboard[$this.ycoord+1][$this.xcoord-1].isalive()) {
                    $neighbours += 1
                }
            }
            #bottommid 0,1
            if ($gameboard[$this.ycoord+1][$this.xcoord].isalive()) {
                $neighbours += 1
            }
            #bottomright 1,1
            if ($this.xcoord -le ($width-1)) {
                if ($gameboard[$this.ycoord+1][$this.xcoord+1].isalive()) {
                    $neighbours += 1
                }
            }
        }
        $this.neighbourCount = $neighbours
    }   
}