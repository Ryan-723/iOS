//
//  Lab3View.swift
//  _MT_8829850
//
//  Created by user228704 on 7/4/23.
//

import UIKit

class Lab3View: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    @IBOutlet weak var fNameTxt: UITextField!
    
    
    @IBOutlet weak var lNameTxt: UITextField!
    
    
    @IBOutlet weak var countryTxt: UITextField!
    
    
    
    @IBOutlet weak var ageTxt: UITextField!
    
    
    @IBOutlet weak var outputView: UITextView!
    
    
    
    @IBOutlet weak var labelV: UILabel!
    
    
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
    
    
    
    func checkInfo() -> Bool {
        if (fNameTxt.text == "" || lNameTxt.text == "" || countryTxt.text == "" || ageTxt.text == "") {
            return false
        } else {
            return true
        }
        
    }
    
    
    
    
    
}
