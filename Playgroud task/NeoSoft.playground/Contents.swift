import UIKit

var greeting = "Hello, playground"

var serialQueue = DispatchQueue(label: "com.fynd.SerialQueue")
serialQueue.sync {
    serialQueue.async {
        for _ in 1...5 {
            print("hey")

        }
    }
}


final class FirstClass{
    public static var shared = FirstClass()
    
    private init(){
        
    }
    
    func addData(){
        print("Data Added")
    }
}

//FirstClass.shared.addData()

let firstClass = FirstClass.shared  //FirstClass()
firstClass.addData()


var arrayInt = [2,5,7,3,8,10]

let fileredArray = arrayInt.filter({$0>5})

print("fileredArray",fileredArray)

let mapArray = arrayInt.map{$0*3}

print("mapArray",mapArray)

//Anirudh Gupta
let split = "Anirudh Gupta".split(separator: " ")
print("SppliData",split)
var localData = ""
for i in split{
    print("asdf",i)
   let data =  i.reduce(" ") { partialResult, lastChar in
        return String(lastChar) + partialResult
    }
   
    localData += data
    
    
}
print(localData)


