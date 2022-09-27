//
//  SortingByVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 18/09/2022.
//

import UIKit

protocol UsenigSortingFilterProtocol {
    func didUserUseingFilter(name: String)
    func didUserTappDoneOrCancelButton(tabBar: UITabBar?)
    
}

class SortingByVC: UIViewController {
    
    // MARK: - OUtlets
    
    @IBOutlet weak var bacgroundView: UIView!
    @IBOutlet weak var sortingByCollectionView: UICollectionView!

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerSortingByCell()
        Helper.customViews(views: [bacgroundView], cornerRadius: nil)
    }
    
    
    
    
    // MARK: - Proerties
    
    var selecedRow = 0
    
    var delegate: UsenigSortingFilterProtocol? = nil
    
    var sortingTitleArray = ["Popular","Newest","Customer review","Price: highest to low"]

  
    
    // MARK: - Actions
    
    @IBAction func exiteBtnPressed(_ sender: UIButton) {
        self.delegate?.didUserTappDoneOrCancelButton(tabBar: self.tabBarController?.tabBar)
        dismiss(animated: true)
      
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        sortingAlert()
    }
    
    
    
    
    // MARK: - Functions
    
    func registerSortingByCell () {
        sortingByCollectionView.register(UINib(nibName: K.idSortingByCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idSortingByCollectionCell)
        sortingByCollectionView.delegate=self
        sortingByCollectionView.dataSource=self
    }
    
    
    func sortingAlert () {
        let alert = UIAlertController(title: "Confirm Sort", message: "are you sure to use sorting filter", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            
            self.delegate?.didUserUseingFilter(name: self.sortingTitleArray[self.selecedRow])
            self.delegate?.didUserTappDoneOrCancelButton(tabBar: self.tabBarController?.tabBar)
            
            self.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            self.dismiss(animated: true)
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    

}


    // MARK: - Extensions

extension SortingByVC: Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sortingTitleArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let sortingCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSortingByCollectionCell, for: indexPath) as? SortingByCollectionViewCell{
            
            sortingCell.sortingLBL.text = sortingTitleArray[indexPath.row]
            return sortingCell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selecedRow = indexPath.row
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width , height = collectionView.frame.height
        return CGSize(width: width - 32, height: height * 0.25)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    
}



