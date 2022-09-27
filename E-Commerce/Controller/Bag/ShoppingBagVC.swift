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
    
    
    @IBOutlet weak var myBagCollection : UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "My Bag"
        tabBarController?.tabBar.selectedItem?.title = ""
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    

    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    
    var myBagArray: [ProductsModel] = [
        ProductsModel(id: 0, price: 51, title: "Pullover", image: "Pullover", description: "Mango"),
        ProductsModel(id: 1, price: 34, title: "Blouse", image: "Blouse", description: "Dorothy Perkins"),
        ProductsModel(id: 2, price: 12, title: "T-shirt", image: "T-shirt", description: "Lost link"),
        ProductsModel(id: 3, price: 51, title: "Shirt", image: "Shirt", description: "Topshop"),
        ProductsModel(id: 4, price: 43, title: "Light blouse", image: "Light blouse", description: "Dorothy Perkins"),
        ProductsModel(id: 5, price: 43, title: "Top blouse", image: "Top blouse", description: "Dorothy Perkins")
    ]
    
    var islist = true
    

    // MARK: - Functions
    
    
    func registerCell(){
        subCategoriesCollection.register(UINib(nibName: K.idSubCategoriesColltionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idSubCategoriesColltionIdCell)
        myBagCollection.register(UINib(nibName: K.idListProductionCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idListProductionCollectionCell)
        myBagCollection.register(UINib(nibName: K.idGridCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridCollectionCell)
        
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
            return myBagArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let products = myBagArray[indexPath.row]
        
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSubCategoriesColltionIdCell, for: indexPath) as? SubCategoriesCollectionViewCell {
                
                cell.newCollectionLBL.text = subCategoriescolleectionArray[indexPath.row]
                return cell
            }
            
        default:
            if islist {
                
                if let lisetCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListProductionCollectionCell, for: indexPath) as? ListProductsCollectionViewCell {
                    
                    //lisetCell.delegate=self
                    
                    lisetCell.titleLBL.text = products.title
                    lisetCell.productImage.image = UIImage(named: products.image)
                    lisetCell.priceLBL.text = "$ \(products.price)"
                    lisetCell.descriptionLBL.text = "\(products.id)" //products.description
                    
                    lisetCell.cellRow = indexPath.row
                    
                    if products.isFavorite{
                        lisetCell.favoriteBtn.setImage(K.isFavoriteImage, for: .normal)
                    }else{
                        lisetCell.favoriteBtn.setImage(K.notFavoriteImage, for: .normal)
                    }
                    
                   
                    return lisetCell
                }
            }else{
                if let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridCollectionCell, for: indexPath) as? GridCollectionViewCell{
                    
                    gridCell.productImageView.image = UIImage(named: products.image)
                    gridCell.priceLBL.text = "$ \(products.price)"
                    gridCell.produtsTitlLBL.text = products.title
                    gridCell.descriptionLBL.text = products.description
                    
                    gridCell.cellRow = indexPath.row
                    
//                    gridCell.favoriteBtnTappedClousre = { [unowned self] row in
//                        let isFavorite =  self.productsArray[row].isFavorite
//                        self.productsArray[row].isFavorite = !isFavorite
//                        self.productsCollection.reloadData()
//
//                    }
                    
                    if products.isFavorite{
                        gridCell.favoriteBtn.setImage(K.isFavoriteImage, for: .normal)
                    }else{
                        gridCell.favoriteBtn.setImage(K.notFavoriteImage, for: .normal)
                    }
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
                return CGSize(width: width , height: height / 4)
            } else {
                // convertCollectionGridOutlet.setImage(UIImage(named: "grid"), for: .normal)
                return CGSize(width: width / 2  , height: height * 0.5)
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
