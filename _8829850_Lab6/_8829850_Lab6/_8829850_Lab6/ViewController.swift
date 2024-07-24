//
//  ViewController.swift
//  _8829850_Lab6
//
//  Created by user228704 on 6/16/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet weak var tableVC: UITableView!
    
    
    var myGarage: [String] = ["Honda", "Toyota", "Ford", "KIA", "VW"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableVC.delegate = self
        self.tableVC.dataSource = self
        
    }

    @IBAction func addButton(_ sender: Any) {
        let alertBox = UIAlertController(title: "Add Item",message: "Add Item", preferredStyle: .alert)
                    
            alertBox.addTextField{(textField : UITextField!) -> Void in textField.placeholder = "Enter your Text Here"}
                
            alertBox.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
            alertBox.addAction(UIAlertAction (title: "Ok", style: .default, handler: {alert -> Void in let textFieldOne = alertBox.textFields![0] as UITextField
                    
                    
            let userInput = textFieldOne.text
            if(userInput!.isEmpty){
                return
            }
            
            self.myGarage.append(userInput!)
            self.tableVC.reloadData()
                    
                    
            }))
            present(alertBox, animated: true)    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
       
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return myGarage.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
           
           cell.textLabel?.text = myGarage[indexPath.row]
           
           return cell
       }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if (editingStyle == .delete) {
                self.myGarage.remove(at: indexPath.row)
                self.tableVC.reloadData()
            }
        }
}

