import UIKit

var greeting = "Hello, playground"


//MARK :- Part 1
func ishavingAddedSequence(input : [Int],sumofNum : Int)->(Bool){
for i in stride(from: 0, through: input.count-1, by: 1){
    var sqAdd = 0
    for j in stride(from: i, through: input.count-1, by: 1){
         sqAdd += input[j]
        if sqAdd == sumofNum{
            sqAdd = 0
            return (true)
        }else{
            continue
        }
    }
    
}
    return (false)
}

//let nums = ishavingAddedSequence(input: [1,2,3,7,5], sumofNum: 8)
print("Part 1 :")
print("A[] = {1,2,3,7,5} , S = 6 ==> Output :",ishavingAddedSequence(input: [1,2,3,7,5], sumofNum: 6))
print("A[] = {1,2,2,8,5} , S = 12 ==> Output :",ishavingAddedSequence(input: [1,2,2,8,5], sumofNum: 12))
print("A[] = {1,2,3,7,5} , S = 16 ==> Output :",ishavingAddedSequence(input: [1,2,3,7,5], sumofNum: 16))

//MARK :- Part 2
func addedSequenceIndex(input : [Int],sumofNum : Int)->(Int,Int,Bool){
for i in stride(from: 0, through: input.count-1, by: 1){
    var sqAdd = 0
    for j in stride(from: i, through: input.count-1, by: 1){
         sqAdd += input[j]
        if sqAdd == sumofNum{
            sqAdd = 0
            return (i,j,true)
        }else{
            continue
        }
    }
    
}
    return (0,0,false)
}

let numIndex = addedSequenceIndex(input: [1,2,3,7,5], sumofNum: 12)
print("Part 2 :")
numIndex.2 ? print("Output -> {\(numIndex.0),\(numIndex.2)} (first subarray which return sum 12 is {2,3,7}. And index of 2 and 7 in array A is \(numIndex.0),\(numIndex.2))") : print()

