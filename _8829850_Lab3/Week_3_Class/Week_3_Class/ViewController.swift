//
//  ViewController.swift
//  Week_3_Class
//
//  Created by user228704 on 5/25/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBOutlet weak var fNameTxt: UITextField!
    
    
    @IBOutlet weak var lNameTxt: UITextField!
    
    
    @IBOutlet weak var countryTxt: UITextField!
    
    
    
    @IBOutlet weak var ageTxt: UITextField!
    
    
    @IBOutlet weak var outputView: UITextView!
    
    
    @IBAction func addBtn(_ sender: Any) {
        outputView.text = "Full Name: \(fNameTxt.text!) \(lNameTxt.text!) \nCountry: \(countryTxt.text!) \nAge: \(ageTxt.text!) "
    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
        if (checkInfo()){
            labelV.text = "Successfully submitted"
        }else{
            labelV.text = "Complete the missing info!"
        }
    }
    
    
    @IBAction func clearBtn(_ sender: Any) {
        fNameTxt.text = ""
        lNameTxt.text = ""
        countryTxt.text = ""
        ageTxt.text = ""
        outputView.text = ""
        labelV.text = ""
    }
    
    
    
    
    @IBOutlet weak var labelV: UILabel!
    
    func checkInfo() -> Bool {
        if (fNameTxt.text == "" || lNameTxt.text == "" || countryTxt.text == "" || ageTxt.text == "") {
            return false
        } else {
            return true
        }
        
    }
    
    
}

