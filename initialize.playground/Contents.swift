import UIKit

var greeting = "Hello, playground"

class A {
    var a : Int
    var b : String
    var c : Int?
    let website : String // if we assign value for it then we cant initialize
//    init(){
//        print("Getting Error , Bcz Stored property not getting value")
//    }
    
    init(a : Int, b : String,change Constant : String){
        self.a = a
        self.b = b
        self.website = Constant
    }
//    init(change Constant : String){
//        self.website = Constant
//    }
}

let a = A(a: 1, b: "1",change: "aaa")
a.a = 10
a.b = "qq"


struct Rect{
    var width : Int
    var height : Int
}

var rect = Rect(width: 10, height: 20)
rect.width = 10

// Convience Int

class Student{
    var name : String
    var age : Int
    init(user name : String,userAge age : Int){
        self.name = name
        self.age = age
    }
    convenience init(){
        self.init(user: "Shyamala", userAge: 27)
    }
}

let stu = Student()
print("Hello Student",stu.name)


var num = 10
var clur = { num in
    print("Num is",num)
    
}
num = 20
clur(100)

// Inheritance with initializer

class School{
    var name : String
    var location : String
    
    init(name : String,location : String){
        self.name = name
        self.location = location
    }
    convenience init(location : String){
        self.init(name: "PCSchool", location: location)
    }
}

class Teacher : School{
    var Tname : String
    var subj : String
//    init(tname : String){
//        self.Tname = tname
//
//    }
    init(name : String,subj : String,school : School){
        
//        super.init(name: school.name, location: school.location) // Property 'self.Tname' not initialized at super.init call
        self.Tname = name
        self.subj = subj
//        super.name = "Shyam" // 'self' used in property access 'name' before 'super.init' call
        super.init(name: school.name, location: school.location)
        super.name = "Barath"
     //   super.init(location: school.location) //Must call a designated initializer of the superclass 'School'
        
    }
    
    override init(name: String, location: String) {
        self.Tname = "Overrider Default"
        self.subj = "Overrider subj"
        super.init(name: name, location: location)
    }
    
    
//    override convenience init(location : String){ //Initializer does not override a designated initializer from its superclass
////        self.init(name: "Shyamala", subj: "IT", school: School(name: "NSSChool", location: "MainTheni")) // School if super class init so will produce error
////        self.init(name: "Chennai", location: "MAINTHENI") // superclass overrider method
//        self.subj = "IT"
//        self.init(tname: "HELLO_SHYAM")
//
//
//    }
}

let teachObj = Teacher(name: "Saranya", subj: "ECE", school: School(location: "Theni"))
print("Teacher_Detail",teachObj.name,teachObj.subj,teachObj.Tname,teachObj.location)

//let tech = Teacher(name : "NEw",location : "Chennai") // Super class initi cont call , it will work after writhing Ovrride fun


let tech = Teacher(name : "NEw",location : "Chennai")
print("Teacher_Detail",tech.name,tech.subj,tech.Tname,tech.location)


/*
 A designated initializer must call a designated initializer from its immediate superclass.
 A convenience initializer must call another initializer from the same class.
 A convenience initializer must ultimately call a designated initializer.
 
 ***
 Note: The convenience initializer must call the designated initializer of the same class using self.init Let’s define a subclass of the above class as shown below.
 
 A subclass can modify inherited properties of the superclass only after the super.init is called.
 */


//Required

class TeacherRequired{
    var studentName : String
    var subjName : String
    
    required init(sname : String , ssname : String){
        self.studentName = sname
        self.subjName = ssname
    }
    
    required convenience init(_ss : String){
        self.init(sname: "SaranyaTech", ssname: _ss)
    }
}

class schoolList : TeacherRequired{
    var schlName : String
    init(sclName : String){
        self.schlName = sclName
        super.init(sname: "HHHH", ssname: "NNNN")
    }
    required init(sname: String, ssname: String) {
        self.schlName = "HIGHER"
        super.init(sname: sname, ssname: ssname)
    }
    
    required convenience init(_ss : String){
        self.init(sname: "SaranyaTech", ssname: _ss)
    }
}
let sl = schoolList(sname: "Hello", ssname: "Wru")
print("SchoolList",sl.schlName,sl.subjName,sl.studentName)


let _SS = schoolList(_ss: "OHOHO")
print("School_SS",_SS.schlName,_SS.subjName,_SS.studentName)


let normalInit = schoolList(sclName: "HHHH")
print("SchoolList",normalInit.schlName,normalInit.subjName,normalInit.studentName)


//Automatic

class Name{
    var name : String
    init(n : String){
        self.name = n
    }
    
    convenience init(){
        self.init(n: "HELLONAME")
    }
}
let nameDetail = Name(n: "SHYAM")
print("NameDetail_IS",nameDetail.name)

class Tutorial : Name{
    var tutorial : String = "Swift"
    
}

let tut = Tutorial(n: "")
print("SSS",tut.tutorial)


let tuts = Tutorial()
print("SSS",tuts.name)
