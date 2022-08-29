//
//  ViewController.swift
//  NeoSoft
//
//  Created by Shyamala's MacBook Pro on 17/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var vm : MainVM?
    var rowCounts : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVM()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func updateRowAct(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdatedNumVC") as! UpdatedNumVC
        vc.passRowsCount = {[unowned self] rowCount in
            self.setupCell()
            self.rowCounts = rowCount
            self.tableView.reloadData()
        }
        self.present(vc, animated: true)
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowCounts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath) as! RowCell
        cell.colorCollection.reloadData()
        cell.colorCollection.isHidden = (indexPath.row % 4 == 0) ? false : true
        cell.colorView.isHidden = (indexPath.row % 4 == 0) ? true : false
        cell.colorView.backgroundColor = Colors().colors[indexPath.row % 4]
        cell.selectedCell = {[weak self] selectedCell in
            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "ColorDetailVC") as! ColorDetailVC
            vc.detailData = ColorDetails(bgColor: Colors().colors[selectedCell], rowCount: indexPath.row, ColumCount: selectedCell)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ColorDetailVC") as! ColorDetailVC
        vc.detailData = ColorDetails(bgColor: Colors().colors[indexPath.row % 4], rowCount: indexPath.row, ColumCount: 0)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func setupCell(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "RowCell", bundle: .main), forCellReuseIdentifier: "RowCell")
    }
}

extension ViewController{
    func initVM(){
        self.vm = MainVM(vc: self)
        self.vmResponse()
    }
    
    func vmResponse(){
       
        
    }
    
    
}

