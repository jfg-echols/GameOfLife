$array1 = @(1,2,3)
$array2 = @(4,5,6)
$array3 = @(7,8,9)

# $array1 -join ' '
# $array2 -join ' '
# $array3 -join ' '

$metarray = @{}
$metarray[0] = $array1
#$metarray
#"--"
$metarray[1] = $array2
#$metarray
#"----"
$metarray[2] = $array3
$metarray

"------"
$metarray[2][0]

write-host "number of rows: $($metarray.count)"
write-host "number of columns: $($metarray[0].Count)"