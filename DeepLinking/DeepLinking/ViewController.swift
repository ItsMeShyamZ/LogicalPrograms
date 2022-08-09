//
//  ViewController.swift
//  DeepLinking
//
//  Created by Shyamala's MacBook Pro on 07/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fetchLbl : UILabel!
    
    var datas : String = "No Data"

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.fetchLbl.text = datas
        
        
    }


}

