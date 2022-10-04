//
//  SlesctSizeVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 15/09/2022.
//

import UIKit

class SelesctSizeVC: UIViewController {

    // MARK: - OUtlets
    
    @IBOutlet weak var selectSizeBgView: UIView!
    
    @IBOutlet weak var addToCartBtnOutlet: UIButton!
    
    @IBOutlet weak var sizeCollectionView: UICollectionView!
        // MARK: - Life Cycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        Helper.customViews(views: [selectSizeBgView , addToCartBtnOutlet], cornerRadius: nil)
    }
    
    // MARK: - Propeerties
    
    var sizeArray = ["All" , "Xl" , "L" , "M" , "Xs" , "S"]

    // MARK: - Actions
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addToCardBtnPressed(_ sender: UIButton) {
        addToCartAlert()
    }
    
    
    // MARK: - Functions
    
    func registerCell(){
        sizeCollectionView.register(UINib(nibName: K.idSelesctSizeCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idSelesctSizeCollectionCell)
        
        sizeCollectionView.delegate=self
        sizeCollectionView.dataSource=self
    }
    
    func addToCartAlert () {
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

// MARK: - Extession

extension SelesctSizeVC: Typealias.collectionView_DataSourece_Delegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sizeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let sizeCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSelesctSizeCollectionCell, for: indexPath) as? SelectSizeCollectionViewCell {
            
            //sizeCell.sizeBtnOUtlet.setTitle(sizeArray[indexPath.row], for: .normal)
            sizeCell.sizeLBL.text = sizeArray[indexPath.row]
            return sizeCell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width * 0.3 , height: height * 0.35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
