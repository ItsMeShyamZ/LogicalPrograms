import Foundation

//var greeting = "Hello, playground"
//
//func swap<T>(a : inout T,b: inout T){
//
//    let c = a
//    a = b
//    b = c
//
//
//}
//var a = 5
//var b = 10
//swap(a: &a, b: &b)
//
//print("Value After Swap",a,b)
//
////let url =  URL(string: "")
////let urlRes = URLRequest(url:url!)
////let task = URLSession.shared.dataTask(with: urlRes) { data, response, error in
////
////}
////
////task.resume()
//
//protocol Test{
//   // associatedtype T
//    func addNum( a : String)
//
//}
//extension Test{
//    var name : String {
//        get{
//            return "HEllo"
//        }
//    }
//}
//
//
//class NewClass : Test{
//    func addNum(a: String) {
//
//    }
//
//    var name : String = ""
//
//    func classNewClass(){
//        var nc = NewTestClass()
//        nc.delegate = self
//        nc.printNewValue()
//    }
//
//    func addNum(a: Int) {
//        print("A")
//    }
//
//    typealias T = Int
//
//}
//class NewTestClass{
//    var delegate : Test?
//
//    init(){
//
//    }
//
//    func printNewValue(){
//        print("NewValue" , delegate?.name ?? "")
//    }
//
//}
//
//
//NewClass().classNewClass()

//let flatArray = newMultiDiArray.flatMap($0)
//print("FlatArray",flatArray)

//let numbers =  [[1],[2],[3,4], [5, [6, 7,[8,[9]]]]] //[[1,2,3],[4],[5,6,7,8,9]]
//let flattened = numbers.flatMap { $0 }
//print("flattened",flattened)


var newMultiDiArray : [Any] = [1,2,[3,4], [5, [6, 7,[8,[9]]]]]

func flattenArray(num : [Any]) -> [Int]{
    var nums : [Int] = [Int]()
    for i in num{
        if let e = i as? Int{
            nums.append(e)
        }
        if let ae = i as? [Any]{
            let res = flattenArray(num: ae)
            nums = nums + res
        }
    }
    return nums
}

let flatenNum = flattenArray(num: newMultiDiArray)

print("flatenNum is" , flatenNum)
