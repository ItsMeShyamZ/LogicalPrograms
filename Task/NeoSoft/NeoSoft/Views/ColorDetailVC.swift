//
//  ColorDetailVC.swift
//  NeoSoft
//
//  Created by Shyamala's MacBook Pro on 17/08/22.
//

import UIKit

class ColorDetailVC: UIViewController {
    
    @IBOutlet weak var rowCountLbl : UILabel!
    @IBOutlet weak var columCountLbl : UILabel!
    
    var detailData : ColorDetails?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = detailData?.bgColor ?? .clear
        self.rowCountLbl.text = "Row Index : \(detailData?.rowCount ?? 0)"
        self.columCountLbl.text = "Collection Index : \(detailData?.ColumCount ?? 0)"
    }
    

    

}
