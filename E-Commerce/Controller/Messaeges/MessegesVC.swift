//
//  ChatViewController.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 13/09/2022.
//

import UIKit

class MessegesVC: UIViewController {
    
// MARK: - Outletes
    
    @IBOutlet weak var messegesTableVIew: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        tabBarController?.title = "Messeges"
        navigationItem.backButtonTitle = ""
        title = "Messeges List"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem.title = "Fav"
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
//    func addBarButton (buttonImage:  UIImage?) {
//
//        let chatImageBarButton = UIBarButtonItem(image: buttonImage, style: .plain, target: MessegesVC.self, action: nil)
//        self.navigationItem.leftBarButtonItem = chatImageBarButton
//    }
    

    // MARK: - Functions
    
    func registerCell(){
        messegesTableVIew.register(UINib(nibName: K.idMessegesTableViewCell, bundle: nil), forCellReuseIdentifier: K.idMessegesTableViewCell)
        
        messegesTableVIew.delegate=self
        messegesTableVIew.dataSource=self
    }
  

}

// MARK: - Extensions
extension MessegesVC: Typealias.tableView_DataSourece_Delegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let messegCell = tableView.dequeueReusableCell(withIdentifier: K.idMessegesTableViewCell) as? MessegesTableViewCell {
            if indexPath.row % 2 == 0 {
                messegCell.messegeStackView.alignment = .leading
                //chatCell.chatMessegLBL.textAlignment = .right
                messegCell.chatMessegLBL.text = " messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege messege"
            }else{
                messegCell.messegeStackView.alignment = .trailing
                //chatCell.chatMessegLBL.textAlignment = .left
                messegCell.chatMessegLBL.text = " messege messege"
               // messegCell.chatMessegLBL.textAlignment = .left
            }
            return messegCell
        }
       return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
        
    }
    
}
