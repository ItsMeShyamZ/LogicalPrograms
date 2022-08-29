//
//  CustomCollectionViewCell.swift
//  CollectionViewCompositionLayout
//
//  Created by Shyamala's MacBook Pro on 15/08/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBG : UIView!
    @IBOutlet weak var cellItem : UILabel!
    @IBOutlet weak var bottom : NSLayoutConstraint!
    @IBOutlet weak var trail : NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
