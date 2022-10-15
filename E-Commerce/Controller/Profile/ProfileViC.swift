//
//  ProfileViC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 17/09/2022.
//

import UIKit
 import Alertift

class ProfileViC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "Profile"
        tabBarController?.tabBar.selectedItem?.title = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        logOut()
    }
    
    func logOut(){
        let parameter = ["fcm_token": K.token] as? [String: Any]
        
        ApiCall.fetchData(url: K.urlLogout, method: .post, parameter: parameter, headers: K.authorizHeaders, encoding: nil) { (data: LogOutModel?, error) in
            if let error{
                print(error)
            }else{
    
                UserDefaults.standard.removeObject(forKey: "token")
                Alertift.alert(title: "تسجيل الخروج", message: data?.message)
                    .action(.default("تم"), handler: {
                        
                        self.logOutAction()
                    })
                    .show(on: self) // show on specified view controller
            }
        }

        
        
        
        
    } // Function End
    
    
    func logOutAction(){
        let window = UIWindow (frame: UIScreen.main.bounds)
        
        let storBoard = UIStoryboard(name: K.mainStoryboardId, bundle: nil)
        let signVC = storBoard.instantiateViewController(withIdentifier: K.signiInVCid)
        let nav = UINavigationController(rootViewController: signVC)
        signVC.modalTransitionStyle = .flipHorizontal
        window.rootViewController = nav
        window.makeKeyAndVisible()
        nav.navigationItem.hidesBackButton = true
      
        self.navigationController?.pushViewController(signVC, animated: true)
    }
    
} // Class End
