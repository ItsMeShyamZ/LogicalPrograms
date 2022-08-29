import UIKit

var greeting = "Hello, playground"

func characterCount(str : String) -> [String : Int]{
    var charDic : [String : Int] = [String : Int]()
    for i in str{
        charDic[String(i),default: 0] += 1
    }
    return charDic
}

print("Character List", characterCount(str: greeting))


let arrayInt = [21,103,89,55,76,88,90]
var largestInt : Int = 0
var secondLargertInt : Int = 0
for i in arrayInt.enumerated(){
    if i.offset == 0{
        largestInt = i.element
        secondLargertInt = i.element
    }else{
        if i.element > largestInt{
            secondLargertInt = largestInt
            largestInt = i.element
        }else if i.element < largestInt{
            if i.element > secondLargertInt{
                secondLargertInt = i.element
            }
        }
    }
    
}
print("Largest and Second Largest Num",largestInt,secondLargertInt)




let seqNum = [10,8,9,2,3,5,4,2,1,7,6,7]

var seqDic = [String : Int]()

for num in seqNum{
    if seqDic["\(num)"] == 1{
        print("Duplicate Num is",num)
        
    }else{
        seqDic["\(num)",default:0] += 1
    }
}

print("Duplicate Date",seqDic)


var pair = [[Int]]()

func finePairs(giveNum : Int,giveArray : [Int]){
    pair.removeAll()
    for i in stride(from: 0, to: giveArray.count, by: 1)
    {
        for j in stride(from: 0, to: giveArray.count, by: 1){
            if (giveArray[i] + giveArray[j]) == giveNum{
                if pair.contains([giveArray[i] ,giveArray[j]]) || pair.contains([giveArray[j] ,giveArray[i]]){
                    print("Contain Data",giveArray[i] ,giveArray[j])
                }else{
                    pair.append([giveArray[i] ,giveArray[j]])
                }
                
            }
        }
    }
    print("Pair Values",pair)
            
}



finePairs(giveNum: 11, giveArray:  [10,8,9,2,3,5,4,1,7,6])
