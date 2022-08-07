import UIKit

var greeting = "Hello, playground"

// Divided By Zero

enum NewError : Error{
    case divideByZero
}

func division(divisor : Int, divident : Int) throws -> Int{
    if divident == 0{
        throw NewError.divideByZero
    }else if divisor/divident == 0{
        throw NewError.divideByZero
    }else{
        return divisor/divident
    }
}


let num = try! division(divisor: 10, divident: 2)
print("Remaining",num)

//let divide = try! division(divisor: 10, divident: 0) // Crash


let divide = try? division(divisor: 10, divident: 0)
print("Divide",divide)

do{
    let divideError = try division(divisor: 10, divident: 0)
}catch(NewError.divideByZero){
    print("Error is", NewError.divideByZero)
}
