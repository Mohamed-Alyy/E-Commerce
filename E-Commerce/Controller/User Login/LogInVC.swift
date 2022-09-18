//
//  LogInVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 31/08/2022.
//

import UIKit

class LogInVC: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInBtnOutlet: UIButton!
    @IBOutlet weak var forgotPasswordLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    override func viewWillLayoutSubviews() {
        Helper.customViews(views: [emailTF,passwordTF,logInBtnOutlet], cornerRadius: 0.2)
        addGasturTap()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
    }
    
    func addGasturTap(){
        forgotPasswordLBL.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordLBLTapped))
        forgotPasswordLBL.addGestureRecognizer(tap)
       
    }

    @objc func forgotPasswordLBLTapped () {
   
        if let forgotPassVC = storyboard?.instantiateViewController(withIdentifier: K.forgotPassVCid) as? ForgotPasswordVC {
            
            // pop current view controller from navigation stack before we push a new view controller
            
            var vcsArray = navigationController?.viewControllers
            
            vcsArray?.removeLast()
            vcsArray?.append(forgotPassVC)
            if let vcs = vcsArray {
                navigationController?.setViewControllers(vcs, animated: true)
            }
            
            
        }
    }


}
