//
//  ViewController.swift
//  RelationalCoreData
//
//  Created by Shyamala's MacBook Pro on 13/08/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var cdm : CDMain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cdm = CDMain.shared
        //**** Delete ****
//        self.deleteAllClass_With_EatchObj()
//        self.deletAll_BatchDelete()
//
        self.AddClassDetails(name: "1st", ct: "Josh", sec: "A")
        self.AddClassDetails(name: "1st", ct: "Marry", sec: "B")
        self.AddClassDetails(name: "1st", ct: "Avila", sec: "C")

//     self.fetchAllClassDetails()

//        self.fetchWithPredicate(name: "Marry")
        
    }
    

}


extension ViewController{
        func deletAll_BatchDelete(){
            let context = CDMain.shared.container.viewContext
            let bacthDelete = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Class"))
            
            try? context.execute(bacthDelete)
            print("After Excute Batch Delete")
            self.fetchAllClassDetails()
        }
    
        func deleteAllClass_With_EatchObj(){
            let context = cdm?.container.viewContext
            let fq = NSFetchRequest<Class>(entityName: "Class")
    
            let fetch = try! context?.fetch(fq)
            if (fetch?.count ?? 0) > 0{
            for i in fetch!{
                context?.delete(i)
            }
            }
           try! context?.save()
        }
    
    //    func fetchClassData(){
    //        let context = cdm?.container.viewContext
    //        let fetchClass = NSFetchRequest<Class>(entityName: "Class")
    //        do{
    //            let data = try context?.fetch(fetchClass)
    //            print("CLass Data is",data)
    //        }catch{
    //            print("Fetching error",error)
    //        }
    //    }
    
        func AddClassDetails(name : String,ct : String,sec : String){
            let context = CDMain.shared.container.viewContext
            let ClassObj = Class(context: context)
            ClassObj.name = name
            ClassObj.classTeacher = ct
            ClassObj.section = sec
            try! context.save()
    
        }
    
        func fetchAllClassDetails(){
            let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Class")
            do{
                let classList = try CDMain.shared.container.viewContext.fetch(Class.fetchRequest())
                print("classList",classList.count)
                for i in classList{
                    print("Class ==>",i.name,i.classTeacher,i.section)
                }
            }catch{
                print("Fetching Error",error)
            }
    
        }
        func fetchWithPredicate(name : String){
            let fr = NSFetchRequest<Class>(entityName: "Class")
            fr.predicate = NSPredicate(format: "classTeacher == %@", name)
            do{
            let rqData = try CDMain.shared.container.viewContext.fetch(fr)
            for i in rqData{
                print("rqData",i.name,i.classTeacher,i.section)
            }
            }catch{
                print("FetchDataError",error)
            }
        }
    
        func FetchWithURL(){
    
        }
}
