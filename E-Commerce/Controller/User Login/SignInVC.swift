//
//  SignInVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 31/08/2022.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signInBtnOutlet: UIButton!
    @IBOutlet weak var haveAccoutLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.customViews(views: [nameTF,emailTF,passwordTF,signInBtnOutlet], cornerRadius: 0.2)
        addGasturTap()
        
    }
          
    
    // if user sing in success go to collection tabBar (home collection view controller)
    @IBAction func signINButnPressed(_ sender: UIButton) {
        
        // Push form Main Storyboard to Products Storyboard
        let storyboard = UIStoryboard(name: K.productiosStoryboardId, bundle: nil)
        if let collectonTB = storyboard.instantiateViewController(withIdentifier: K.collectionTabBarid) as? CollectionTabBC {
           
            // pop all view controllers from navigation stack before we push a new view controller as the root
            var vcsArray = navigationController?.viewControllers
            vcsArray?.removeAll()
            vcsArray?.append(collectonTB)
            navigationController?.setViewControllers(vcsArray!, animated: true)
            
        }

    }
    
    
    
    func addGasturTap(){
        let taped = UITapGestureRecognizer(target: self, action: #selector(haveAccountTapped))
        haveAccoutLBL.addGestureRecognizer(taped)
        haveAccoutLBL.isUserInteractionEnabled = true
    }

    @objc func haveAccountTapped () {
       
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: K.loginVCid) as? LogInVC {
            
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}
  




