//
//  ViewController.swift
//  _8829850_Lab2
//
//  Created by user228704 on 5/18/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var mycount = 0
    var stepvalue = 1
    
    @IBOutlet weak var count: UILabel!
    
    
    
    @IBAction func increment(_ sender: Any) {
        mycount = mycount + stepvalue
        
        count.text = String(mycount)
    }
    
    
    @IBAction func decrement(_ sender: Any) {
        mycount = mycount - stepvalue
        
        count.text = String(mycount)
        
    }

    
    
    
    @IBAction func reset(_ sender: Any) {
        mycount = 0
        count.text = String(mycount)
    }
    

    @IBAction func stepbutton(_ sender: Any) {
        if
            stepvalue == 1 {stepvalue=2}
        else {stepvalue = 1}    }
    

    
}

