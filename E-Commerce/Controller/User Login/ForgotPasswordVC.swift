//
//  ForgotPasswordVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 31/08/2022.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    // MARK: - OUTLETS
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var sendBtnOutlet: UIButton!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.customViews(views: [emailTF,sendBtnOutlet], cornerRadius: 0.2)
      //  navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
    }
    
    

    
    @IBAction func sendBtnPressed(_ sender: UIButton) {
        
    }
    
    
 
    
    
    
}
