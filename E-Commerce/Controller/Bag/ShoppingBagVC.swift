//
//  ShoppingBagVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 22/09/2022.
//

import UIKit

class ShoppingBagVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var subCategoriesCollection: UICollectionView!
    
    @IBOutlet weak var convertCollectionGridBtnOutlet: UIButton!
    
    @IBOutlet weak var myBagCollection : UICollectionView!
    
    @IBOutlet weak var promoCodeTF: UITextField!
    
    @IBOutlet weak var checkOutBtnOutlet: UIButton!
    @IBOutlet weak var totalAmountLBL: UILabel!
    @IBOutlet weak var totalPriceLBL: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "My Bag"
        tabBarController?.tabBar.selectedItem?.title = ""
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.customViews(views: [promoCodeTF , checkOutBtnOutlet], cornerRadius: nil)
        registerCell()
    }
    
    

    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    var islist = true
    
    // MARK: - Actions
    
    @IBAction func convertCollectionGridBtnPressed(_ sender: UIButton) {
        islist = !islist
        myBagCollection.reloadData()
    }
    
    
    @IBAction func checkOutBtnPressed(_ sender: UIButton) {
        
    }

    // MARK: - Functions
    
    
    func registerCell(){
        subCategoriesCollection.register(UINib(nibName: K.idSubCategoriesColltionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idSubCategoriesColltionIdCell)
        myBagCollection.register(UINib(nibName: K.idListBagCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idListBagCollectionCell)
        myBagCollection.register(UINib(nibName: K.idGridBagCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridBagCollectionCell)
        
        subCategoriesCollection.delegate=self
        subCategoriesCollection.dataSource=self
        myBagCollection.delegate=self
        myBagCollection.dataSource=self
        
    }
   

}


extension ShoppingBagVC: Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case self.subCategoriesCollection :
            return subCategoriescolleectionArray.count
            
        case self.myBagCollection :
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //  let products = myBagArray[indexPath.row]
        
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            // return MySubCategoryCollection
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSubCategoriesColltionIdCell, for: indexPath) as? SubCategoriesCollectionViewCell {
                
                cell.newCollectionLBL.text = subCategoriescolleectionArray[indexPath.row]
                return cell
            }
            
        default:
            if islist {
                // return ListBagCollection
                convertCollectionGridBtnOutlet.setImage(UIImage(named: "list"), for: .normal)
                if let lisetCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListBagCollectionCell, for: indexPath) as? ListBagCollectionViewCell {
                  
                    
                   
                    return lisetCell
                }
            }else{
                // return GridBagCollection
                convertCollectionGridBtnOutlet.setImage(UIImage(named: "grid"), for: .normal)
                if let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridBagCollectionCell, for: indexPath) as? GridBagCollectionViewCell{
                    
  
                    return gridCell
                }
            }
            
            
        }
        myBagCollection.reloadData()
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width , height = collectionView.frame.height
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            return CGSize(width: width / 4, height: height * 0.8)
            
        case self.myBagCollection :
            
            if islist == true {
               // convertCollectionGridOutlet.setImage(UIImage(named: "list"), for: .normal)
                return CGSize(width: width , height: height / 3)
            } else {
                // convertCollectionGridOutlet.setImage(UIImage(named: "grid"), for: .normal)
                return CGSize(width: width / 2  , height: height * 0.7)
            }
            
        default:
            return CGSize(width: width, height: height)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
       
        case subCategoriesCollection:
            return 0
        default:
           return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
            
        case subCategoriesCollection:
            return 16
        default:
           return 0
        }
    }
}
