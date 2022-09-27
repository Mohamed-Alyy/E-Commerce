//
//  MessagesVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 12/09/2022.
//

import UIKit

class ChatListVC: UIViewController {

    @IBOutlet weak var CahtListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "Chat List"
        navigationItem.backButtonTitle = ""
        
    }
    // MARK: - Property
    
    var messegeProfileImagesArray = [UIImage(named: "man")]

    func registerCell () {
        CahtListTableView.register(UINib(nibName: K.idChatTableViewCell, bundle: nil), forCellReuseIdentifier: K.idChatTableViewCell)
        CahtListTableView.delegate=self
        CahtListTableView.dataSource=self
    }
  

}

extension ChatListVC : Typealias.tableView_DataSourece_Delegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let messegeCell = tableView.dequeueReusableCell(withIdentifier: K.idChatTableViewCell) as? ChatTableViewCell{
            
            messegeCell.profileImageView.image = messegeProfileImagesArray[indexPath.row]
            
            return messegeCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //tableView.frame.height / 10
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let messegesVC = storyboard?.instantiateViewController(withIdentifier: K.chatVCid) as? MessegesVC{
            
            //messegesVC.navigationItem.backButtonTitle = ""
            //navigationController?.navigationItem.backButtonTitle = ""
            
            navigationController?.pushViewController(messegesVC, animated: true)
        }
    }
}
