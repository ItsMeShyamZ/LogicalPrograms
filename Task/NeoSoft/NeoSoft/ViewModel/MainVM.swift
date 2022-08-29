//
//  MainVM.swift
//  NeoSoft
//
//  Created by Shyamala's MacBook Pro on 17/08/22.
//

import UIKit

class MainVM{
    
    var vc : UIViewController?
    
    var passRowsCount : ((Int)->())?
    var errorRows : ((String)->())?
    var successRows : ((Int)->())?
//    var rowCount : Int {
//        get{
//            return self.rowCount
//        }set{
//            self.rowCount = newValue
//        }
//
//    }
    init(vc : UIViewController){
        self.vc = vc
    }
    
    func fetchAndPassRowsCount(row : String){
        if row.isEmpty || row == "0" || (Int(row) ?? 0) == 0{
            errorRows?("Please Enter Row Count and The Count should more that 0")
        }
        else{
            let rowCount = Int(row) ?? 0
            self.successRows?(rowCount)
            self.passRowsCount?(rowCount)
        }
    }
    
    
   
    
}
