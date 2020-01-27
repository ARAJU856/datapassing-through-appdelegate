//
//  ViewController.swift
//  datapassing through appdelegate
//
//  Created by A RAJU on 11/26/19.
//  Copyright © 2019 A RAJU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelRef:AppDelegate!
  
    @IBOutlet weak var uiView: UIView!
    
    var ypos = 50
    
    var label1 = (String)()
    var label2 = (String)()
    
    //craating the add button
    @IBAction func submitBtn(_ sender: Any) {
        
        //changing the view controller
        
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as! FirstViewViewController
        present(firstVC,animated: true)
      
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if(appDelRef.dataDict["Msg1"] != nil && appDelRef.dataDict["lastName"] != nil)
        {
            
        ypos+=50
        var lb1 = UILabel()
        lb1.frame = CGRect(x: 20, y: ypos, width: 200, height: 30)
        //  lb1.backgroundColor = .green
        uiView.addSubview(lb1)
        lb1.text = appDelRef.dataDict["Msg1"]!
        
        ypos+=50
            
        var lb12 = UILabel()
        lb12.frame = CGRect(x: 20, y: ypos, width: 200, height: 30)
        // lb12.backgroundColor = .green
        uiView.addSubview(lb12)
         lb12.text = appDelRef.dataDict["lastName"]!
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

    
          appDelRef = UIApplication.shared.delegate as! AppDelegate
    
        
    }
   
        
    
  
}

