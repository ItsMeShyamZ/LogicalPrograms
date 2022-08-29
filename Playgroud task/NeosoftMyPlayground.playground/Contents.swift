import UIKit

var greeting = "Hello, playground"

class FirstClass {
//    public static let shared = FirstClass()
    
//    private init(){
//
//    }
    
//    static func addNum(){
//        print("Fun name Added")
//    }
    
    class func addNum(){
        print("Fun name Added")
    }
}

//FirstClass.shared.addNum()
FirstClass.addNum()

//struct DI{
//    var data : NewDI
////    init(data : NewDI){
////
////    }
//}
//
//struct NewDI{
//
//    let di = DI()
//    di.data = self
//}



let e = [1,1,2,2,3,3]

func countRepeatedElemet(elemet : [Int]) -> [String : Int]{
    var countDic = [String : Int]()
    for i in elemet{
        countDic["\(i)",default: 0] += 1
    }
    return countDic
}

print("Counted Value", countRepeatedElemet(elemet: e))
