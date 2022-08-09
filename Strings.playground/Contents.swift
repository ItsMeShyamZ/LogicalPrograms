import UIKit


/**
 1.Reverse
 2.Dublicate count
 3.remove Dublicate
 4.Vowels counts
 5.String sort
 6.String comparision
 7.String  to count total number of alphabets, digits and special characters in a string
 
 8.find maximum occurring character in a string
 9.remove all spl characters in string
 10.replace lowercase characters by uppercase and vice-versa
 11. Concatenate Two Strings Manually
 12.find the largest and smallest word in a string.
 13.check whether a character is Hexadecimal Digit or not
 14.replace the spaces of a string with a specific character
 15.split string by space into words
 16. count of each character in a given string
 17.
 Sort = {bubble sort,}
 */

// Reverse
var greeting = "Greeting"
//1.
func reverse(str : String) -> String{
    str.reduce("") { partialResult, ele in
        return "\(ele)"+partialResult
    }
}

print("Reverse Data",reverse(str: greeting))

//2.
func reverseStr(str : String)->String{
    var reverseChar = [Character]()
    for char in str{
        reverseChar.insert(char, at: 0)
    }
    return String(reverseChar)
}


print("Reverse Data",reverseStr(str: greeting))

//3.
func reverseStr_three(str : String)->String{
    var reverseChar = ""
    for char in str{
        reverseChar = String(char) + reverseChar
    }
    return String(reverseChar)
}


print("Reverse_Data_Three",reverseStr_three(str: greeting))
//4.
print("Reverse_Data_4",String(greeting.reversed()))
//5.
print("Reverse_Data_4_char",greeting.reversed())


var arrayData = [10,11,12,13,14,15,16,17]

let res = arrayData.reduce(0) { partialResult, data in
    return partialResult+data
}
print("result",res)



//6.Reverse Fun with Recursion
func reverse_fun(str : String)->String{
    
    if str.isEmpty{
       return ""
    }else{
        print("str",str)
    return String(str[str.index(str.startIndex, offsetBy: str.count - 1)]) + reverse_fun(str: str.substring(to: str.index(str.startIndex, offsetBy: str.count - 1)))
    }
}

print("reverse_funs",reverse_fun(str: greeting))

//7.
func findCharacterCount(str : String)->[String:Int]{
    var charCount = [String:Int]()
    
    for char in str{
        charCount[String(char).uppercased(),default:0] += 1
        
    }
    return charCount
}


print("Character Count",findCharacterCount(str: greeting))

//8.Find Dublicated
print("Character Keys",Array(findCharacterCount(str: greeting).keys))

//9.String into Array
print("String to array",Array(greeting))

//10.Remove Duplicates
print("Remove_Duplicates",Set(greeting.map{$0.uppercased()}))

//11.Remove Duplicates _ "Ordered"


print("Ordered_Unique",NSOrderedSet(array: greeting.map{$0.uppercased()}))


//Vowels Count
func getVowelsCount(str : String)->[String:Int]{
    var VowelsCount = [String : Int]()
    
    for char in str{
        if ["a","e","i","o","u"].contains(String(char)){
            VowelsCount[String(char),default: 0] += 1
        }
    }
    return VowelsCount
}

print("Getting_VowelsCount",getVowelsCount(str: greeting))
print("Total_Vowels_Count",getVowelsCount(str: greeting).reduce(0){(res,ele) in res+(ele.value)})


//count total number of alphabets, digits and special characters in a string

func countAlphbetsDigist(str:String)->[String:Int]{
    var CharCount = [String:Int]()
    for i in Array(str){
        if (i >= "a" && i <= "z") || (i >= "A" && i <= "Z"){
            CharCount["Alphabets",default: 0] += 1
        }
        else if (Int(i.description) != nil ){
            CharCount["Digit",default: 0] += 1
        }else{
            CharCount["special_characters",default: 0] += 1
        }
    }
        return CharCount
}

print("Alphabets_Digit_special_characters",countAlphbetsDigist(str: "SHYAM@123!RAM"))




/*
 1.Reduce for Revese String
 2.Dictinoary With Default Value
 3.NSOrderedSet , return Order element
 */

//.String sort

var strarray = ["KOfi", "Abena", "Peter", "Kweku", "Akosua"]
//print("Sort",strarray.sorted())
//let sortedArray = strarray.sorted { str1, str2 in
//    return str1 > str2
//}
//print("strarray",sortedArray)


func shortFunc(){
    for i in stride(from: 0, through: strarray.count-1, by: 1){
        for j in stride(from: 0, through: strarray.count-1, by: 1){
            if strarray[i] > strarray[j]{
                let temp = strarray[i]
                strarray[i] = strarray[j]
                strarray[j] = temp
            }
        }
    }
    print("Swap_sort",strarray)
}
shortFunc()

print("String into Array" , Array("Shyamala"),NSOrderedSet(array: Array("Shyamala")))

func compareStr(lhs : String = "Shyamala",rhs : String = "shyamala"){
    for i in stride(from: 0, through: lhs.count-1, by: 1){
        print("Character",Array(lhs)[i].description,Array(rhs)[i].description)
        if Array(lhs)[i].description.caseInsensitiveCompare(Array(rhs)[i].description) == .orderedSame{
            continue
        }else{
            print("Sorry")
            break
        }
    }
}

compareStr()

//Replace lowercase to uppercare and viceversa
func lowCaseUpperCase(str : String = "ShyamAla") -> String
{
    return str.map{ $0.isUppercase ? $0.lowercased() : $0.uppercased()
    }.reduce("") { partialResult, ele in
         return partialResult+ele
    }
    
}

print("UPPERLOWER",lowCaseUpperCase())



print("concodinate","SHYAMALA"+" "+"RAMANATHAN")

var largeStr = "Hardships often prepare ordinary people for an extraordinary destiny"
var largeStrs = ""
 var smallStr = ""
for i in largeStr.split(separator: " ").enumerated(){
    if i.offset == 0{
        largeStrs = String(i.element)
        smallStr = String(i.element)
        continue
    }else{
        if smallStr.count > i.element.count{
            smallStr = String(i.element)
        }
        if largeStrs.count < i.element.count{
            largeStrs = String(i.element)
        }
    }
}
print("largeStrslargeStrs",largeStrs,smallStr)


//Replace
let replaceStr = largeStr.replacingOccurrences(of: " ", with: "&")
print("replaceStr",replaceStr)

var replaceCharArray = Array(largeStr)
for i in replaceCharArray.enumerated(){
    if String(i.element) == "&"{
        largeStr.remove(at: largeStr.index(largeStr.startIndex, offsetBy: i.offset))
        largeStr.insert(" ", at: largeStr.index(largeStr.startIndex, offsetBy: i.offset))
    }
}
print("largeStr",largeStr)

let splitStr = largeStr.split(separator: " ")
print("splitStr",splitStr)

print("ArrayOFChar",Array(largeStr))

print("Separate",largeStr.components(separatedBy: " "))

var splitedArray = [String]()
var splitWord = ""
for i in Array(largeStr).enumerated(){
    if String(i.element) != " "{
        splitWord = splitWord+String(i.element)
        if i.offset == largeStr.count - 1{
            splitedArray.append(splitWord)
            splitWord = ""
        }
    }else{
        splitedArray.append(splitWord)
        splitWord = ""
    }
}
print("splitedArray",splitedArray)

var countDic = [String : Int]()
for i in largeStr{
    if i != " "{
        countDic[String(i),default: 0] += 1
    }
}

print("CountCharcter",countDic)

var substringArray = [String]()
var subStr = ""
for i in Array("abcbnaumowabumdlacgwsanlkwjsas").enumerated(){
    if subStr.count > 0{
        if subStr.substring(to: subStr.index(subStr.startIndex, offsetBy: 1)).description == i.element.description{
            substringArray.append(subStr)
            subStr = i.element.description
        }else{
            subStr = subStr+i.element.description
        }
        if i.offset == "abcbnaumowabumdlacgwsanlkwjsas".count - 1{
            substringArray.append(subStr)
            subStr = ""
        }
    }else{
        subStr = subStr+i.element.description
    }
}
print("substringArray",substringArray)


//finde largest substring
var largesSubArray = [String]()
var largesSub = ""
var smallSub = ""
for i in Array("aaaabbaacccdeeef fffffff").enumerated(){
    if largesSub.count > 0{
        if largesSub.description.contains(i.element.description){
            largesSub =  largesSub+i.element.description
         }else{
            largesSubArray.append(largesSub)
            if smallSub.isEmpty{
                 smallSub = largesSub
             }else{
                 if smallSub.count > largesSub.count{
                     smallSub = largesSub
                 }
             }
            largesSub = ""
            largesSub = largesSub+i.element.description
        }
        if i.offset == "aaaabbaacccdeeeffffffff".count - 1{
            largesSubArray.append(largesSub)
        }
    }else{
        largesSub = largesSub+i.element.description
    }
}

print("Substrings",largesSubArray,smallSub,largesSub)
