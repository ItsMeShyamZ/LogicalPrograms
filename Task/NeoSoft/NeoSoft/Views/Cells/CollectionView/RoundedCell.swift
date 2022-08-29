//
//  RoundedCell.swift
//  NeoSoft
//
//  Created by Shyamala's MacBook Pro on 17/08/22.
//

import UIKit

class RoundedCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorView.layer.cornerRadius = self.colorView.frame.height / 2
        self.colorView.backgroundColor = .blue
    }

}
