//
//  UpdatedNumVC.swift
//  NeoSoft
//
//  Created by Shyamala's MacBook Pro on 17/08/22.
//

import UIKit

class UpdatedNumVC: UIViewController {

    @IBOutlet weak var NoofRowsTxF: UITextField!
    @IBOutlet weak var errorLabl: UILabel!
    
    var vm : MainVM?
    
    var passRowsCount : ((Int)->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabl.isHidden = true
        self.NoofRowsTxF.delegate = self
        self.vm = MainVM(vc: self)
        self.vmResponse()
    }
    
    @IBAction func DoneBtnAct(_ sender: UIButton) {
        self.vm?.fetchAndPassRowsCount(row: self.NoofRowsTxF.text ?? "")
    
    }
    
}

extension UpdatedNumVC : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.errorLabl.isHidden = true
    }
    
   
}

extension UpdatedNumVC{
    func vmResponse(){
       
        self.vm?.successRows = {[weak self] count in
            self?.passRowsCount?(count)
            self?.dismiss(animated: true)
        }
        
        self.vm?.errorRows = {[weak self] errMsg in
            self?.errorLabl.text = errMsg
            self?.errorLabl.isHidden = false
        }
    }
}
