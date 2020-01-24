#printing static board because need to figure otu arrays first
$xvalue = 20
$yvalue = 20
# $xvalue = read-host "input number of columns:"
# $yvalue = read-host "input number of rows:"


$rowsArray = @()
$printarray = @()
for ($i=0;$i -lt $yvalue; $i+=1) {
    $columnsarray = @()
    

    # ##adding numbers 0 to xvalue
    # for ($j=0; $j -lt $xvalue; $j+=1) {
    #     $columnsarray += $j
    # }

    ##simulating board
    for ($j=0; $j -lt $xvalue; $j+=1) {
        if ($j -ne 5) {
            $columnsarray += ' '
        } else {
            $columnsarray += 'O'
        }
    } #EZ

    $rowsArray += $columnsarray
    $printArray += $columnsarray -join ' '
    
    
}
$printarray

