function MoveLeft ($Position,$Array) {


$origPos=$position
$origArr=$Array



if ($Position -eq 0) {$Position = $Array.count -1;$More="Fixed"}

    $Current=$Array[$Position]
    $Pre=$Array[$Position-1]
    $Array[$Position]=$Pre
    $Array[$Position-1]=$Current

}

function HowManyCombinations ($NoOfThings) {

$n=$NoOfThings
$nP=1
$i=$n
1..($n-1) | % {
    $np=$i*($n-$_)
    $i=$np 
}

return $np

}

function GetCombinations ($string,[switch]$CharStream) {

    $TotalCombinations=0

    $strArr=$string.toCharArray()

    $TotalNumberOfThings=$strArr.count

    $xFactor=((HowManyCombinations -NoOfThings $TotalNumberOfThings)/$TotalNumberOfThings)
    #"$TotalNumberOfThings / $((HowManyCombinations -NoOfThings $TotalNumberOfThings)) / $xfactor"
           
     
    for ($i=0;$i -le ($TotalNumberOfThings-1); $i++) {
    #First loop iteratates throught each thing

        $Selectedthing=$strArr[$i]
        
        [System.Collections.ArrayList]$RemainingThings=$strArr
        $RemainingThings.RemoveAt($i)

        #"Selected: $Selectedthing Remaining: $RemainingThings"

        #For each selected thing as position 1, run thought possible combinations of remaining things 
        #Run combinations by shuffling the current last digit all the way to position 2

        $TotalNumberOfRemainingThings=$RemainingThings.count
       
        #$TotalCombinations++       
           
                
            for ($x=0;$x -lt $xFactor  ; $x++) {

              if ($d -lt 1 ) {$d=$TotalNumberOfRemainingThings-1}

              MoveLeft -Position $d -Array $RemainingThings
              $d--
              $TotalCombinations++  

              if ($CharStream) {

              ("$($strArr[$i])$($RemainingThings -join '')").ToCharArray()
                

              } else {

                "$($strArr[$i])$($RemainingThings -join '')"

              }
              
                
            }

                  

                 
             

          
      }
    #$TotalCombinations
    }





clear

GetCombinations -string "Luis" 
