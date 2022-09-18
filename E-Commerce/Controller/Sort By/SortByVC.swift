//
//  SortByVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 11/09/2022.
//

import UIKit

class SortByVC: UIViewController {

    // MARK: - OUTLETS
    
   
    @IBOutlet weak var popularBtnOutlet: UIButton!
    
    
    @IBOutlet weak var popUpView: UIView!

    @IBOutlet var listViews: [UIView]!
    
    @IBOutlet var listLBL: [UILabel]!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
    
    override func viewDidLayoutSubviews() {
        Helper.customViews(views: listViews, cornerRadius: nil)
        Helper.customViews(views: [popUpView,popularBtnOutlet], cornerRadius: nil)
    }
   
    // MARK: - Properties
    
    var isSelected = false

    
    // MARK: - Actions
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    @IBAction func foneBtnPressed(_ sender: UIButton) {
        sortAlert()
    }
    
    @IBAction func orderBtnsPressed(_ sender: UIButton) {
        
        listViews.forEach({$0.backgroundColor = .white})
        listViews.first(where: {$0.tag == sender.tag})?.backgroundColor = .red
        
        listLBL.forEach({$0.textColor = .black})
        listLBL.first(where: {$0.tag == sender.tag})?.textColor = .white
        
    }
    
   
    
  
    

    // MARK: - Functions
    
    func sortAlert () {
        let alert = UIAlertController(title: "Confirm Sort", message: "are you sure to use sorting filter", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            //self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    
}
