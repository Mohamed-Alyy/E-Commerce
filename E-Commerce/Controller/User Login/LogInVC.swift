//
//  LogInVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 31/08/2022.
//

import UIKit
import SwiftyJSON
import Alertift

class LogInVC: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInBtnOutlet: UIButton!
    @IBOutlet weak var forgotPasswordLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        login()
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
    
    
    
    func login(){
        guard  !emailTF.text!.isEmpty && !passwordTF.text!.isEmpty else {return}
        
        let parameters: [String: Any] = ["email": emailTF.text! , "password" : passwordTF.text!]
        ApiCall.fetchData(url: K.urlLogin, method: .post, parameter: parameters, headers: nil) { (data: BaseResponse<Login>?, error) in
            if let error = error {
                print(error.localizedDescription)
                Alertift.alert(title: "خطأ", message: data?.message)
                    .action(.default("تم"))
                    .show(on: self)
               
            }else{
                
                if data?.status == false {
                    Alertift.alert(title: "خطأ", message: data?.message)
                        .action(.default("تم"))
                        .show(on: self)
                }else{
                    let token = data?.data?.token
                    UserDefaults.standard.set(token, forKey: "token")
                    print(token)
                    let tabBar = UIStoryboard(name: K.productiosStoryboardId, bundle: nil).instantiateViewController(withIdentifier: K.collectionTabBarid)
                   
                    tabBar.navigationItem.hidesBackButton = true
                    Alertift.alert(title: "تسجيل الدخول", message: data?.message)
//                        .action(.default("تم")){
//                            self.navigationController?.pushViewController(tabBar, animated: true)
//                        }
                        .action(.default("تم"), handler: {
                            self.navigationController?.pushViewController(tabBar, animated: true)
                        })
                        .show(on: self) // show on specified view controller
                }
                }
              
        }
        
    }
    
  
    
    // VC End
}
