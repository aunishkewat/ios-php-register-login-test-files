//
//  ViewController.swift
//  loginphp
//
//  Created by Aunish kewat on 26/03/21.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    let URL_USER_LOGIN =  "http://192.168.64.2/phplogin/login.php"
    
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }
  
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        if (textFieldUserName.text == "" || textFieldPassword.text == ""){
            labelMessage.text = "invalid username and password"
        }
        else{
        
        let parameters:Parameters=["request":"login","username":textFieldUserName.text!,"password":textFieldPassword.text!]
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
        {
            response in
            print(response)
            
            if let result = response.result.value{
            let jsonData = result as! NSDictionary
                
                if (!(jsonData.value(forKey: "error")as! Bool)){
                    let storyBoard:UIStoryboard = UIStoryboard(name: "ViewController", bundle: nil)
                    
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                    self.present(newViewController, animated: true, completion: nil)
                }else{
                    self.labelMessage.text = "invalid username and password";
                }
            }
            
        }
    }
                               
    }
    
    
    @IBAction func gotoRegister(_ sender: UIButton) {
        
        if (textFieldUserName.text == "" || textFieldPassword.text == ""){
            labelMessage.text = "invalid username and password"
        }
        else{
            let parameters:Parameters=["request":"register","username":textFieldUserName.text!,"password":textFieldPassword.text!]
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
        {
            response in
            print(response)
            
            if let result = response.result.value{
                let jsonData = result as! NSDictionary
                self.labelMessage.text = jsonData.value(forKey: "message") as! String?
            }
            
        }
    }
        
    }
}
           
    

