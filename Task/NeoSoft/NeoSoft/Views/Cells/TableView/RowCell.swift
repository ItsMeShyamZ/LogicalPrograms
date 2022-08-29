//
//  RowCell.swift
//  NeoSoft
//
//  Created by Shyamala's MacBook Pro on 17/08/22.
//

import UIKit

class RowCell: UITableViewCell {

    @IBOutlet weak var colorView : UIView!
    @IBOutlet weak var colorCollection : UICollectionView!
    
    var selectedCell : ((Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension RowCell : UICollectionViewDelegate, UICollectionViewDataSource{
   
    func setupCollection(){
        self.colorCollection.delegate = self
        self.colorCollection.dataSource = self
        self.colorCollection.register(UINib(nibName: "RoundedCell", bundle: .main), forCellWithReuseIdentifier: "RoundedCell")
        self.colorCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundedCell", for: indexPath) as! RoundedCell
        cell.colorView.backgroundColor = Colors().colors[indexPath.row]
        return cell
    }
}
