//
//  ViewController.swift
//  UIUNitTesting
//
//  Created by Shyamala's MacBook Pro on 25/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var noiseMakerName : [String] = ["Shyamala"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    @IBAction func loginAction(_ sender : UIBarButtonItem){
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true)
    }
    
    
    @IBAction func AddAct(_ sender: UIBarButtonItem) {
        self.showAlertView()
        
    }
    
    func showAlertView(){
        let alert = UIAlertController(title: "Add Noise Maker", message: "what's the name of noise maker ?", preferredStyle: .alert)
        alert.addTextField { tf in
            tf.placeholder = "Enter Name"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { action in
            let tf = alert.textFields![0]
            self.noiseMakerName.insert(tf.text ?? "", at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .left)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.noiseMakerName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.noiseMakerName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.noiseMakerName.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isEditing = true
    }
    
}

