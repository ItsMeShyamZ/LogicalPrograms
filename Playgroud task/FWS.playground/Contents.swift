import UIKit

var greeting = "Hello, playground"

protocol SampleProtocol{
    func sample()
}

class SampleClass : SampleProtocol{
    func sample() {
        
    }
}

let  latters = "ABCDABDAB"
var letDec = [String:Int]()
for i in latters{
    letDec[String(i),default: 0] += 1
}

print("LettersCount",letDec)

let dict = [

            "A" : [1, 2],

            "Z" : [3, 4],

            "P" : [7, 9],

            "D" : [5, 6],

            "B" : [8, 3]

        ]

print("Desc",dict.sorted { ele, ele1 in
    ele.key < ele1.key
})

