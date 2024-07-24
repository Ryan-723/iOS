//
//  Lab2View.swift
//  _MT_8829850
//
//  Created by user228704 on 7/4/23.
//

import UIKit

class Lab2View: UIViewController {

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
    
    // setting initail value to 0 and the value increased by step
    var mycount = 0
    var stepvalue = 1
    
    @IBOutlet weak var count: UILabel!
    
    
    
    // Incrementing the count
    @IBAction func increment(_ sender: Any) {
        mycount = mycount + stepvalue
        
        count.text = String(mycount)
    }
    
    
    // Decrementing the count
    @IBAction func decrement(_ sender: Any) {
        mycount = mycount - stepvalue
        
        count.text = String(mycount)
        
    }

    
    
    
    // Resetting the count
    @IBAction func reset(_ sender: Any) {
        mycount = 0
        count.text = String(mycount)
    }
    

    // increasing the step value
    @IBAction func stepbutton(_ sender: Any) {
        if
            stepvalue == 1 {stepvalue=2}
        else {stepvalue = 1}    }
    

    
    
    
    
    
    
}
