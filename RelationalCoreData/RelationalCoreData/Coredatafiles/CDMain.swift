//
//  CDMain.swift
//  RelationalCoreData
//
//  Created by Shyamala's MacBook Pro on 13/08/22.
//

import Foundation
import CoreData


class CDMain{
    
    public static var shared = CDMain()
    
    lazy var cloudcontainer : NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "RelationalCoreData")
       
        container.loadPersistentStores { storeData, error in
            if error != nil{
                print("Conainer Error is",error)
            }
        }
        return container
    }()
    

    lazy var container : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RelationalCoreData")
       
        container.loadPersistentStores { storeData, error in
            if error != nil{
                print("Conainer Error is",error)
            }
        }
        return container
    }()
    
    
}
