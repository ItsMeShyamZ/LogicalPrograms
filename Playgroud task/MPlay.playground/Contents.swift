import UIKit

var greeting = "Hello, playground"

var randomNum = [1,3,64,4,77,23,76]
//var asecArra = [Int]()
for i in stride(from: 0, through: randomNum.count-1, by: 1){
    for j in stride(from: 0, through: randomNum.count-1, by: 1){
        if randomNum[i] > randomNum[j]{
            let temp = randomNum[i]
            randomNum[i] = randomNum[j]
            randomNum[j] = temp
        }
    }
}

print("randomNum",randomNum)
print("Second Largest Num is : ", randomNum[1])


print("sorted",randomNum.sorted(by:>)[1])

func secondLargestNum(){
    var randomNum = [1,3,64,4,1234,102,77,101,89,23,76,71,103]
    var large : Int = 0
    var small : Int = 0
    var secondLar : Int = 0
    for i in randomNum.enumerated(){
        if i.offset == 0{
            large = i.element
            small = i.element
            secondLar = i.element
        }else{
            if i.element > large{
                secondLar = large
                large = i.element
            }else if i.element < small {
                small = i.element
            }else  {
                if i.element > secondLar{
                    secondLar = i.element
                }
            }
        }
        print("***",large,small,secondLar)
    }
    print("Large_small",large,small,secondLar)
}

secondLargestNum()

func SubArraySlice(input : [Int],startIndex : Int , endIndex : Int ) ->  ArraySlice<Int>{
    let subarray = input[startIndex...endIndex]
    return subarray
}

SubArray(input : [1,3,64,4,1234,102,77,101,89,23,76,71,103] ,startIndex : 2 , endIndex : 4 )

func SubArray(input : [Int],startIndex : Int , endIndex : Int ) ->  [Int]{
    let subarray = input[startIndex...endIndex]
    return Array(subarray)
}

SubArray(input : [1,3,64,4,1234,102,77,101,89,23,76,71,103] ,startIndex : 2 , endIndex : 4 )

func SubArrayLoop(input : [Int],startIndex : Int , endIndex : Int ) ->  [Int]{
    var localArray = [Int]()
    for i in stride(from: startIndex, through: endIndex, by: 1){
        localArray.append(input[i])
    }
    return localArray
}

SubArrayLoop(input : [1,3,64,4,1234,102,77,101,89,23,76,71,103] ,startIndex : 2 , endIndex : 4 )

var firstArray = [1,2,3,4,5]
var firstCopy = firstArray

firstArray.withUnsafeBufferPointer{ (pointer) in
    print("First Array Pointer",pointer,firstArray)
}

firstCopy.withUnsafeBufferPointer({(pointer) in
    print("Copied Array Pointer",pointer,firstCopy)
})

//print("isEqual",(firstArray === firstCopy))

firstCopy.append(10)
print("BothDaya",firstArray,firstCopy)
firstArray.withUnsafeBufferPointer{ (pointer) in
    print("First Array Pointer",pointer,firstArray)
}

firstCopy.withUnsafeBufferPointer({(pointer) in
    print("Copied Array Pointer",pointer,firstCopy)
})


var a = 10
var b = a
func inoutF (a : inout Int,b : inout Int){
    print("Address of A ",a)
    withUnsafePointer(to: a) {
        print(" str value \(a) has address: \($0)")
    }
    withUnsafePointer(to: b) {
        print("B Str value \(b) had addres : \($0)")
    }
}

inoutF(a: &a,b:&b)

b = 30000000000
inoutF(a: &a,b:&b)
print("A and b",a,b)

// Deep copy the Reffernce Type ith NSCopying Protocol

class CopyA : NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        let copyData = CopyA()
        return copyData
    }
    
    var a = 10
    var b = 20
    var c : Int?
    
    init(){
        c = a
    }
    func inoutF (a : inout Int,b : inout Int,c : inout Int){
        print("Address of A ",a)
        withUnsafePointer(to: a) {
            print(" str value \(a) has address: \($0)")
        }
        withUnsafePointer(to: b) {
            print("B Str value \(b) had addres : \($0)")
        }
        withUnsafePointer(to: c) {
            print("B Str value \(c) had addres : \($0)")
        }
    }
}

let aA = CopyA()
aA.inoutF(a: &aA.a, b: &aA.b, c: &(aA.c)!)

let ab = aA

withUnsafePointer(to: aA) { pointer in
    print("aA is Address",pointer)
}

withUnsafePointer(to: ab) { pointer in
    print("ab is Address",pointer)
}

ab.a = 20

print("ss",aA.a)

// Deep Copy for Refrence Using Copy()

let ac = aA.copy() as! CopyA

let ad = aA
ad.c = 30

print("C value",aA.c,ab.c,ad.c,ac.c)

withUnsafePointer(to: ac) { pointer in
    print("ac is Address",pointer)
}
withUnsafePointer(to: ad) { pointer in
    print("ad is Address",pointer)
}




// Deep copy the Reffernce Type ith Codable Protocol

class Person : NSObject,Codable{
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    func deepCopy() throws -> Person{
        let data = try JSONEncoder().encode(self)
        let copy = try JSONDecoder().decode(Person.self, from: data)
        return copy
    }
}

var p1 = Person(name: "Shyamala")
var p2 = p1
var p3 = try! p1.deepCopy()
p3.name = "Priya"

p2.name = "Saranya"
print("NAme is",p1.name,p2.name,p3.name)





//print("P1 and p2 Address" , p1 , p2)
withUnsafePointer(to: p1) { pointer in
    print("P1 Address is" , pointer)
}

withUnsafePointer(to: p2) { pointer in
    print("P2 Address is" , pointer)
}

withUnsafePointer(to: p3) { pointer in
    print("P2 Address is" , pointer)
}
