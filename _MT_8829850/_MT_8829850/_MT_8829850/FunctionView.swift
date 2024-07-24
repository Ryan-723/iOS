//
//  FunctionView.swift
//  _MT_8829850
//
//  Created by user228704 on 7/4/23.
//

import UIKit

class FunctionView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var valueOfA: UITextField!
    
    
    @IBOutlet weak var valueOfB: UITextField!
    
    
    
    @IBOutlet weak var messegeLbl: UILabel!
    
    
    
    @IBOutlet weak var outputValueLbl: UILabel!
    
    
    @IBAction func calculateBtn(_ sender: Any) {
        
        // Checking if the input field is empty or not and remove previous results
        if (checkIfEmpty()){
            messegeLbl.text = "Enter a value for A and B to find C"
            outputValueLbl.text = ""
            return
        }
        
        // Checking if both input are invalid, if they are show error: "neither inputs are valid" and remove previous results
        if (!checkIfValidInput(input: valueOfA.text!) && !checkIfValidInput(input: valueOfB.text!)) {
            messegeLbl.text = "The value you entered for A & B is invalid"
            outputValueLbl.text = ""
            return
        }
        
        // Checking if input A is invalid, if it is show error: input A is invalid and remove previous results
        if(!checkIfValidInput(input: valueOfA.text!)){
            messegeLbl.text = "The value you entered for A is invalid"
            outputValueLbl.text = ""
        }
        
        // Checking if input b is invalid, if it is show error: input B is invalid and remove previous results
        if(!checkIfValidInput(input: valueOfB.text!)){
            messegeLbl.text = "The value you entered for B is invalid"
            outputValueLbl.text = ""
        }
        
        // If statement if all inputs are valid
        if(!checkIfEmpty() && checkIfValidInput(input: valueOfA.text!) && checkIfValidInput(input: valueOfB.text!)){
            
            // Calculating the output using pythagorean theorem
            let a = Double(valueOfA.text!)
            let b = Double(valueOfB.text!)
            let x = (a!*a!) + (b!*b!)
            let y = x.squareRoot()
            
            // Outputting the value and clearing any previous errors.
            messegeLbl.text = " The value of C according to Pythagorean is "
            outputValueLbl.text = String(y)
            
        }
        
    }
    
    
    @IBAction func clearBtn(_ sender: Any) {
        valueOfA.text = ""
        valueOfB.text = ""
        messegeLbl.text = "Enter a value for A and B to find C"
        outputValueLbl.text = ""
        
    }
    
    func checkIfEmpty() -> Bool {
        if (valueOfA.text == "" || valueOfB.text == "" ) {
            return true
        } else {
            return false
        }
    }
    
    func checkIfValidInput(input: String) -> Bool {
       for chr in input {
          if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
             return true
          }
       }
       return false
    }
    

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
