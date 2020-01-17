## game of life
write-host "doot doot doo! game of life!"
global:$xlen = 20
global:$ylen = 20
global:$yarray = @()
$startcount = get-random -Minimum 1 -Maximum 5

class critter {
    [int]$xcoord
    [int]$ycoord
    [string]$alive

    critter ([int]$x, [int]$y) {
        $this.xcoord = $x
        $this.ycoord = $y
        $this.alive = $false
    }
    
    [string]show () {
        if (this.alive) {
            return "X"
        } else {
            return " "
        }
    }
    
    updateself ($globalarray) {
        $neighbourcount = 0
        #check north
        if ($this.ycoord -gt 0) {
            #check nw
            if ($this.xcoord -gt 0) {
                if ($globalarray[$this.ycoord-1][$this.xcoord -1].alive) {
                    $neighbourcount +=1
                }
            }
            #check n
            if ($globalarray[$this.ycoord-1][$this.xcoord].alive) {
                $neighbourcount +=1
            }
            #check ne
            if ($this.xcoord -lt ($globalarray[$this.ycoord].length -1)) {
                if ($globalarray[$this.ycoord-1][$this.xcoord +1].alive) {
                    $neighbourcount +=1
                }
            }
        }
        #check w
        if ($this.xcoord -gt 0) {
            if ($globalarray[$this.ycoord][$this.xcoord-1].alive) {
                $neighbourcount +=1
            }
        }
        #check e
        if ($this.xcoord -lt ($globalarray[$this.ycoord].length -1)) {
            if ($globalarray[$this.ycoord][$this.xcoord+1].alive) {
                $neighbourcount +=1
            }
        }
        #check south
        if ($this.ycoord -lt ($globalarray.length -1)) {
            #check sw
            if ($this.xcoord -gt 0) {
                if ($globalarray[$this.ycoord+1][$this.xcoord -1].alive) {
                    $neighbourcount +=1
                }
            }
            #check s
            if ($globalarray[$this.ycoord+1][$this.xcoord].alive) {
                $neighbourcount +=1
            }
            #check se
            if ($this.xcoord -lt ($globalarray[$this.ycoord].length -2)) {
                if ($globalarray[$this.ycoord+1][$this.xcoord -1].alive) {
                    $neighbourcount +=1
                }
            }
        }
        if ($this.alive) {
            if (($neighbourcount -lt 2) -or($neighbourcount -ge 4)) {
                $this.alive = $false
            } 
        } else {
            if ($neighbourcount -eq 3) {
                $this.alive = $true
            }
        }
    }

}

function newboard () {
    
    for ($i=0;$i -lt $ylen; $i +=1) {
        $xarray = @() 
        for ($j=0;$j -lt $xlen; $j +=1) {
            $newcritter = [critter]::critter($j,$i)
            $xarray += $newcritter
            # "x array $j"
        }
        # write-host "========="
        # $xarray
        # $xarray.length
        $yarray += @(,$xarray)
    }
    return $yarray
}

function updatescreen ($board) {
    # cls
    Write-Host "   | 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 |"
    write-host "-----------------------------------------------------------------|"
    for ($i = 0; $i -lt $board.length; $i+=1) {
        
        if ($i -lt 10) {
            $preamble = "$i  | "
        } else {
            $preamble = "$i | "
        }
        write-host "$preamble" -NoNewline
        $linearray = $board[$i] -join "  "
        # write-host $board[$i].length
        write-host "$linearray |"
    }
}
$thisboard = newboard
# write-host "--"
# $yarray.length
updatescreen $thisboard