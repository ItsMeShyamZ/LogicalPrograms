import UIKit

var greeting = "Hello, playground"
//[4,4,5,4,3,5]  //4 find the number which occurs the maximum number of times

let numArray = [4,4,5,4,3,5]
var numDic = [String : Int]()
for i in numArray{
    numDic["\(i)",default: 0] += 1
}

let sortedDic = numDic.sorted { firstDic,secDic in
    firstDic.value > secDic.value
}

print("Number Counts :" ,numDic,sortedDic)

print("The Largest Count is", sortedDic[0].key)
