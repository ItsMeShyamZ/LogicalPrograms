//
//  CustomViewController.swift
//  CollectionViewCompositionLayout
//
//  Created by Shyamala's MacBook Pro on 16/08/22.
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var customCollection : UICollectionView!
    @IBOutlet weak var scrollViewWidth : NSLayoutConstraint!
    var dataModel : DataModel?
    var columCount : Int?
    var sectionCount : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customCollection.delegate = self
        customCollection.dataSource = self
        let layout = customCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = -1
        layout.minimumLineSpacing = -1
        customCollection.collectionViewLayout = layout
        customCollection.register(UINib(nibName: "CustomCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        customCollection.register(UINib(nibName: "HeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HeaderCell")
       
        self.jsonParsing { datamodel in
           
           self.dataModel = datamodel
            self.columCount = Int(self.dataModel?.data?[0].teams?[0].points?.count ?? 0) ?? 0
            self.customCollection.reloadData()
        }
    }
}
extension CustomViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.sectionCount =  self.dataModel?.data?.reduce(0, { partialResult, dataArray in
             return partialResult + (dataArray.teams?.count ?? 0)
         })
        return (sectionCount ?? 0) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let cellinWidth = (UIScreen.main.bounds.width / 50)
        
        self.scrollViewWidth.constant = CGFloat((((columCount ?? 0)*50) - 50))
        if section == 0{
            return (self.dataModel?.data?[indexToSec_Row(index: 0).0].teams?[indexToSec_Row(index: 0).1].points?.count ?? 0) + 2 + 2
        }else{
            return (self.dataModel?.data?[indexToSec_Row(index: section - 1).0].teams?[indexToSec_Row(index: section - 1).1].points?.count ?? 0) + 2
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        if (indexPath.row) == (((columCount ?? 0)+2)-1){
            if indexPath.section == 0{
                cell.trail.constant = 0
            }else{
                cell.trail.constant = 2
            }
        }else {
            if indexPath.section == 0 && indexPath.row == ((columCount ?? 0)+2+2)-1{
                cell.trail.constant = 2
            }else{
            cell.trail.constant = 0
            }
        }
        if indexPath.section == ((self.sectionCount ?? 0))  {
            cell.bottom.constant = 2
        }else{
            cell.bottom.constant = 0
        }
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.cellItem.text = ""
            }else{
                if indexPath.row == 20{
                    cell.cellItem.text = "IN"
                }else if indexPath.row == 21{
                    cell.cellItem.text = "Total"
                }else if indexPath.row == 22{
                    cell.cellItem.text = "Net"
                }else{
                cell.cellItem.text = "\(indexPath.row)"
                }
            }
        }else{
            
        }
        if indexPath.section != 0{
        if indexPath.row == 0 {
            cell.cellItem.text = self.dataModel?.data?[indexToSec_Row(index: indexPath.section - 1).0].teams?[indexToSec_Row(index: indexPath.section - 1).1].name ?? ""
        }else if indexPath.row == ((self.dataModel?.data?[indexToSec_Row(index: indexPath.section - 1).0].teams?[indexToSec_Row(index: indexPath.section - 1).1].points?.count ?? 0)+1){
            cell.cellItem.text =  ""
        }
        else{
            if let point = self.dataModel?.data?[indexToSec_Row(index: indexPath.section - 1).0].teams?[indexToSec_Row(index: indexPath.section - 1).1].points?[indexPath.row - 1] {
                cell.cellItem.text = "\(point.point ?? 0 )"
                cell.cellItem.backgroundColor = (point.color ?? "") == "" ? UIColor.white : hexStringToUIColor(hex: point.color ?? "")
            }
        }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            headerView.headerLbl.text = self.dataModel?.data?[indexToSec_Row(index: indexPath.section - 1).0].date ?? ""
            return headerView
           
        default:
            break
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section - 1) % 3 == 0{
            return CGSize(width: customCollection.frame.width, height: 50.0)
        }else{
            return CGSize(width: customCollection.frame.width, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            if indexPath.row == 0{
                return CGSize(width: 150 , height: 50)
            }else{
                if indexPath.row == 20 || indexPath.row == 21 || indexPath.row == 22{
                    return CGSize(width: 67 , height: 50)
                }
                return CGSize(width: 50 , height: 50)
            }
        }else{
            if indexPath.row == 0  {
                return CGSize(width: 150 , height: 50)
            }else if indexPath.row == (((columCount ?? 0)+2)-1){
                return CGSize(width: 200 , height: 50)
            }
            else{
                return CGSize(width: 50 , height: 50)
            }
        }
    }
    
    func indexToSec_Row(index : Int,sectionCount : Int = 0)->(Int,Int){
        let sectionCount = (self.dataModel?.data?.count ?? 0)
        return ((index/sectionCount) , (index%sectionCount))
    }
}

extension CustomViewController{

    func jsonParsing(onComplition : @escaping ((DataModel)->())){
        do{
        if let bundlePath = Bundle.main.path(forResource: "document", ofType: "json"){
            guard let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) else {return}
            let json = try JSONDecoder().decode(DataModel.self, from: jsonData)
            onComplition(json)
        }
        }catch{
            print("Error",error)
        }
    }
}

