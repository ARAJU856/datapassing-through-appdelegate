//
//  FirstViewViewController.swift
//  datapassing through appdelegate
//
//  Created by A RAJU on 11/26/19.
//  Copyright © 2019 A RAJU. All rights reserved.
//

import UIKit

class FirstViewViewController: UIViewController,UITextFieldDelegate {
    
   
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    var appDefRef1:AppDelegate!
   
    
    
    @IBAction func backBtn(_ sender: Any) {
      
          appDefRef1!.dataDict["Msg1"] = textfield1.text!
        
        appDefRef1.dataDict["lastName"] = lastNameTF.text
        
        dismiss(animated: true, completion: nil)
    
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        appDefRef1 = UIApplication.shared.delegate as! AppDelegate
        textfield1.delegate = self
        lastNameTF.delegate = self
        
    }
    
    
    var msg:String!
    
    // creating the toast alert controller
    func toast ()
    {
        
        let alertControl = UIAlertController(title: "WARNING", message: "\(msg!)", preferredStyle: UIAlertController.Style.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { (cancelAlert) in
            
        }
        alertControl.addAction(alertAction)
        present(alertControl, animated: true, completion: nil)
        
    }
    // creatig the textfield validations
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        if(textField == textfield1){
            
            return true
        }
        
        if (textField == lastNameTF) {
            
            if(textfield1.text!.count>1){
                
                return true
                
            }else
            {
                msg = "fill the blanks properly"
                toast()
                return false
               
            }
        }
    
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        if(textField == textfield1 || textField == lastNameTF )
        {
            let allowCharacters = CharacterSet(charactersIn:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
            
            if(string.rangeOfCharacter(from: allowCharacters) != nil||string == "")
            {
                
                return true
            }
            else
            {
                
                msg = "invaild keywords"
                toast()
                return false
              
            }
        }
        
        return true
        
        
    }
    

}
