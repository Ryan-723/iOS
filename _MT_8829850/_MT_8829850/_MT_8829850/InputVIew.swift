//
//  InputVIew.swift
//  _MT_8829850
//
//  Created by user228704 on 7/4/23.
//

import UIKit

class InputVIew: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var cityPic: UIImageView!
    
    
    
    @IBOutlet weak var userCityInput: UITextField!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    @IBAction func findCity(_ sender: Any) {
        // Using If statement to check if input matches the city names, if it does change the image to the city image and clear any previous error
        
        // If city name does not matches display error
        if(userCityInput.text?.lowercased() == "toronto"){
            cityPic.image = UIImage(named: "Toronto")
            errorLabel.text = ""
            return
        }else if(userCityInput.text?.lowercased() == "winnipeg"){
            cityPic.image = UIImage(named: "Winnipeg")
            errorLabel.text = ""
            return
        }else if(userCityInput.text?.lowercased() == "vancouver"){
            cityPic.image = UIImage(named: "Vancouver")
            errorLabel.text = ""
            return
        }else if(userCityInput.text?.lowercased() == "montreal"){
            cityPic.image = UIImage(named: "Montreal")
            errorLabel.text = ""
            return
        }else if(userCityInput.text?.lowercased() == "halifax"){
            cityPic.image = UIImage(named: "Halifax")
            errorLabel.text = ""
            return
        }else if(userCityInput.text?.lowercased() == "calgary"){
            cityPic.image = UIImage(named: "Calgary")
            errorLabel.text = ""
            return
        }else{
            errorLabel.text = "City not Found! Please enter correct city name"
        }
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
