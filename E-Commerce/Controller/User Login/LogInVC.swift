//
//  LogInVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 31/08/2022.
//

import UIKit
import Alamofire

class LogInVC: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var userNameTF: UITextField!
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
        Helper.customViews(views: [userNameTF,passwordTF,logInBtnOutlet], cornerRadius: 0.2)
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
        guard  !userNameTF.text!.isEmpty && !passwordTF.text!.isEmpty else {return}
        
        let parameters: [String: Any] = ["username": userNameTF.text! , "password" : passwordTF.text!]
        
        AF.request(K.urlUserLogin, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: Login.self) { response in
    
            switch response.result {
            case .success(let data):
                let VC = UIStoryboard(name: K.productiosStoryboardId, bundle: nil).instantiateViewController(withIdentifier: K.collectionTabBarid) as! CollectionTabBC
               // UserDefaults.setValue(data.token, forKey: "usertoken")
                //guard  data.token != nil else {return}
                UserDefaults.standard.set(data.token, forKey: "userToken")
                print(data.token)
                self.navigationController?.pushViewController(VC, animated: true)
                
            case.failure(let error):
                print(error)
            }
     
        
        }
    }
}
