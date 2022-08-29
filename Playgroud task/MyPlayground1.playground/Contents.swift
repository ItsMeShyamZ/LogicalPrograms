import UIKit

//var greeting = "Hello, playground"


class Student{
    static var name = "Shyamala"
    class var names : String{
        return "HEllo"
    }
}


class people : Student{
    override class var names : String{
        return "ssss"
    }
}


print("NAme",Student.name,people.names)

func printTest1(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}

printTest1({ print("Hello") })


func autoClos(some : Int, result : @autoclosure ()->()){
    print("Hello")
    result()
    print("End")
}

autoClos(some: 10, result: print("oi")  )
