import UIKit

var greeting = "Hello, playground"

func possiblePositions(x : Int , y : Int) -> [[Int,Int]]{
    var X = x
    var Y = y
    var possiblePosition : [(Int,Int)]?
    if (x >= 0) && (y >= 0){
        X = x+2
        Y = y+1
    }
    print("XY is",X,Y)
    possiblePosition?.append((X,Y))
    
    return possiblePosition ?? [[-1,-1]]
}

possiblePositions(x: 0, y: 0)

