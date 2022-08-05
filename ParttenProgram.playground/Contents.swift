import UIKit

var greeting = "Hello, playground"

for i in stride(from: 0, to: 16, by: 2){
    print("\(i)",terminator: " ")
    
}
print()
for i in stride(from: 0, through: 16, by: 2){
    print("\(i)",terminator: ",")
}
print()

/*
 1
 12
 123
 1234
 12345
 123456
 */

for i in stride(from: 1, through: 6, by: 1){
    for j in stride(from: 1, through: i, by: 1){
        print("\(j)",terminator: "")
        
    }
    print()
}

for i in stride(from: 1, through: 6, by: 1){
    for j in stride(from:1 , through: 6-i, by: 1){
        print("\(j)",terminator: "")
    }
    print()
}

/*
 1
 12
 123
 1234
 12345
 123456
 12345
 1234
 123
 12
 1

 */

// Pyramid (first set the space for given value) , 3 loop (1 row , 1, colum, 1 space)

/*
    1
   1 2
  1 2 3
 1 2 3 4
 */


for i in stride(from: 1, to: 5, by: 1){
    for j in stride(from: 1, to: 5-i, by: 1){
        print(" ",terminator: "")
    }
    for k in stride(from: 1, through: i, by: 1){
        print("\(k)",terminator: " ")
    }
    print()
}

/*

1 2 3 4
 1 2 3
  1 2
   1
 */
for i in stride(from: 1, to: 5, by: 1){
    for spacke in stride(from: 1, to: i , by: 1){
        print(" ",terminator: "")
    }
    for j in stride(from: 1, through: 5-i, by: 1){
        print("\(j)",terminator: " ")
    }
    print("")
}

// Stars
print("Pyramid & Dimand Stars")

/*
                 *
                * *
               * * *
              * * * *
             * * * * *
 */

for i in stride(from: 1, to: 10, by: 1){
    for j in stride(from: 1, to: 10-i, by: 1){
        print(" ",terminator: "")
    }
    for k in stride(from: 1, to: i, by: 1){
        print("*",terminator: " ")
    }
    print()
}

for i in stride(from: 1, to: 10, by: 1){
    for j in stride(from: 1, to: i, by: 1){
        print(" ",terminator: "")
    }
    for k in stride(from: 1, to: 10-i, by: 1){
        print("*",terminator: " ")
    }
    print()
}

/*
       *
      * *
     * * *
    * * * *
   * * * * *
  * * * * * *
 * * * * * * *
* * * * * * * *
* * * * * * * *
 * * * * * * *
  * * * * * *
   * * * * *
    * * * *
     * * *
      * *
       *
     
 */
print("\nRight Triangle")
//2) Right Triangle
/*
 *
 * *
 * * *
 * * * *
 * * * * *
 */

for i in stride(from: 1, through: 5, by: 1){
    for j in stride(from: 1, through: i, by: 1){
        print("*",terminator: " ")
    }
    print()
}
print("\nMirrored Right Triangle")

//3) Mirrored Right Triangle

for i in stride(from: 1, to: 6, by: 1){
    for j in stride(from: 6, to: i, by:  -1){
        print(" ",terminator: " ")
    }
    for k in stride(from: 1, to: i, by: 1){
        print("*",terminator: " ")
    }
    print("")
}
print("\nDownward Triangle")
//4 Downward Triangle

for i in stride(from: 1, to: 6, by: 1){
    for j in stride(from: 1, to: 6-i, by: 1){
        print("*",terminator: " ")
    }
    print()
    //for k in stride(from: 1, to: <#T##Strideable#>, by: <#T##Comparable & SignedNumeric#>)
}

print("\nRight Pascal’s Triangle")

/*
 *
 * *
 * * *
 * * * *
 * * * * *
 * * * *
 * * *
 * *
 *
 */

for i in stride(from: 1, to: 6, by: 1){
    for j in stride(from: 1, to: i, by: 1){
        print("*",terminator: " ")
    }
    print()
}

for i in stride(from: 1, to: 5, by: 1){
    for j in stride(from: 1, to: 5-i, by: 1){
        print("*",terminator: " ")
    }
    print()
}

print("\n Sandglass Pattern")

/*
 * * * * *
  * * * *
   * * *
    * *
     *
     *
    * *
   * * *
  * * * *
 * * * * *

 */

for i in stride(from: 1, through: 6, by: 1){
    for i in stride(from: 6, through: 6-i, by: -1){
        print("",terminator: " ")
    }
    for k in stride(from: 1, through: 6-i, by: 1){
        print("*",terminator: " ")
    }
   print(" ")
}
for i in stride(from: 1, through: 6, by: 1){
    for j in stride(from: 6, through: i, by: -1){
        print("",terminator: " ")
    }
    for k in stride(from: 1, through: i, by: 1){
        print("*",terminator: " ")
    }
   print()
}
