class Cell {
    [bool] $alive
    [int] $xcoord
    [int] $ycoord
    
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
    [void] countNeighbours ($height,$width) {
        if (this.xcoord -le 0) {
            $isleft = $false
        } else { 
            $isleft = $true
        }
        if (this.xcoord -ge ($width-1)) {
            $isright = $false
        }else {
            $isright = $true
        }
        if (this.ycoord -le 0) {
            $istop = $false
        }else {
            $istop = $true
        }
        if (this.ycoord -le ($height -1)) {
            $isbottom = $false
        } else {
            $isbottom = $true
        }
        #WORKING HERE
    }
}