//
//  NewCollectionVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 10/09/2022.
//

import UIKit
import CoreData

class NewCollectionVC: UIViewController {
    
    
    // MARK: - OUTLETS
    @IBOutlet weak var subCategoriesCollection: UICollectionView!
    @IBOutlet weak var productsCollection: UICollectionView!
    @IBOutlet weak var convertCollectionGridOutlet: UIButton!
    
    @IBOutlet weak var filterBtnOutlet: UIButton!
    @IBOutlet weak var orderBtnOutlet: UIButton!
    
    
    
    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    var newCollectionArray: [ProductsModel] = [
        ProductsModel(id: 0, price: 51, title: "Pullover", image: "Pullover", description: "Mango"),
        ProductsModel(id: 1, price: 34, title: "Blouse", image: "Blouse", description: "Dorothy Perkins"),
        ProductsModel(id: 2, price: 12, title: "T-shirt", image: "T-shirt", description: "Lost link"),
        ProductsModel(id: 3, price: 51, title: "Shirt", image: "Shirt", description: "Topshop"),
        ProductsModel(id: 4, price: 43, title: "Light blouse", image: "Light blouse", description: "Dorothy Perkins"),
        ProductsModel(id: 5, price: 43, title: "Top blouse", image: "Top blouse", description: "Dorothy Perkins")
    ]
    
    var islist = true
//    var myFavoritesArrIndex = 0
//    var myFavoritesArr = [ProductsModel]()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProsucstCell()
        reciveFavoriteNotification()
    }
    
    
    
    // MARK: - Actions
    
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        if let filterVC = storyboard?.instantiateViewController(withIdentifier: K.filterVCid) as? FilterColorVC{
            filterVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            filterVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            filterVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            
            filterVC.delegate = self
            
            present(filterVC, animated: true)
        }
    }
    
    @IBAction func priceOrderBtnPressed(_ sender: UIButton) {
        
        if let sortingVC = storyboard?.instantiateViewController(withIdentifier: K.sortingByVCid) as? SortingByVC {
            sortingVC.modalTransitionStyle = .crossDissolve
            sortingVC.modalPresentationStyle = .overCurrentContext
            
            sortingVC.view.backgroundColor = .black.withAlphaComponent(0.7)
            
            sortingVC.delegate=self
            present(sortingVC, animated: true)
        }
    }
    
    @IBAction func convertCollectionGridBtnPressed(_ sender: UIButton) {
        islist = !islist
        productsCollection.reloadData()
    }
    
    
    
    // MARK: - Functions
    
 
    // Register Cell in CollectionView
    func registerProsucstCell () {
        subCategoriesCollection.register(UINib(nibName: K.idSubCategoriesColltionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idSubCategoriesColltionIdCell)
        subCategoriesCollection.dataSource=self
        subCategoriesCollection.delegate=self
        
        productsCollection.register(UINib(nibName: K.idListProductionCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idListProductionCollectionCell)
        
        productsCollection.register(UINib(nibName: K.idGridCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridCollectionCell)
        
        productsCollection.dataSource=self
        productsCollection.delegate=self
        
    }
    
    
    
    // send my favorites to cart and save it in core data when user tap on favorite button (delegate function)
    func saveMyFavoritesInCoreData (row: Int) {
        // 1- Create object from array based on index row
        let myFav = newCollectionArray[row]
        if myFav.isFavorite{
            
            // 2- if this object marked as favorite save it in core data --> (IsFavorie == true)
            CoreDataHelper.saveFavoiteToCoreData(product: myFav)
        }else{
            // 3- if the user remove this object from favorite delete it frome core data  --> (IsFavorie == false)
            CoreDataHelper.deleteObjectFromCoreData(index: row)
        }
        productsCollection.reloadData()
    }
    
    
    // Recive notification post form DetailsVC
    func reciveFavoriteNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(setFavoiteBtnImageUsengNotification), name: NSNotification.Name(K.favoriteNotificationName), object: nil)
    }
    
    
    // do some actions whene recive notification post from ProductDetailsVC
    @objc func setFavoiteBtnImageUsengNotification(_ notification: Notification){
        
        // 1- get information from notification
        guard let isFavorite = notification.userInfo![K.productIsFavoriteNotificationfName] as? Bool else {return}
        guard let productId = notification.userInfo![K.productIdNotificationfName] as? Int else {return}
        
        
        
        // 2- make isFavorite value in current view = IsFavorite in DeatailsVC
        for product in newCollectionArray {
            if product.id == productId {
                newCollectionArray[productId].isFavorite = isFavorite
               // productsCollection.reloadData()
            }
        }
        
        // 3- get instance object form array based on id
        let product = newCollectionArray[productId]
        
        if product.isFavorite{
            // if current favorite object IsFavorite == true save it in core data
            CoreDataHelper.saveFavoiteToCoreData(product: product)
        }else{
            // if current favorite object IsFavorite == false delete it from core data
            CoreDataHelper.deleteObjectFromCoreData(index: productId)
        }
        
        productsCollection.reloadData()
    }
    

    
}


// MARK: - Collection View Extension

extension NewCollectionVC:Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case self.subCategoriesCollection :
            return subCategoriescolleectionArray.count
            
        case self.productsCollection :
            return newCollectionArray.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let products = newCollectionArray[indexPath.row]
        
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSubCategoriesColltionIdCell, for: indexPath) as? SubCategoriesCollectionViewCell {
                
                cell.newCollectionLBL.text = subCategoriescolleectionArray[indexPath.row]
                return cell
            }
            
        default:
            if islist {
                
                if let lisetCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListProductionCollectionCell, for: indexPath) as? ListProductsCollectionViewCell {
                  
                    lisetCell.titleLBL.text = products.title
                    lisetCell.productImage.image = UIImage(named: products.image)
                    lisetCell.priceLBL.text = "$ \(products.price)"
                    lisetCell.descriptionLBL.text = "\(products.id)" //products.description
                    // hide x button
                    lisetCell.xBtnOUtlet.isHidden = true
                    
                    lisetCell.cellRow = indexPath.row
                    lisetCell.delegate=self
                    
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
                    
                    // hide x button
                    gridCell.xBtnOutlet.isHidden = true
                    
                    gridCell.cellRow = indexPath.row
                    
                    gridCell.favoriteBtnTappedClousre = { [unowned self] row in
                        let isFavorite =  self.newCollectionArray[row].isFavorite
                        self.newCollectionArray[row].isFavorite = !isFavorite
                        
                        // send current myFavoriteArr in NewCollectionVC to myFavoritesArray in MyFavoritesVC to add favorite items to Caart
                     //   sendMyFavoriteToCart(array: <#[ProductsModel]#>, row: indexPath.row)
                        // send notification to myfavorite veiw controller to add current opbject to myFavoriteArray
                       // sendMyFavArrayByNotification()
                        
                        self.productsCollection.reloadData()
                        
                    }
                    
                    if products.isFavorite{
                        gridCell.favoriteBtn.setImage(K.isFavoriteImage, for: .normal)
                    }else{
                        gridCell.favoriteBtn.setImage(K.notFavoriteImage, for: .normal)
                    }
                    return gridCell
                }
                
            }
            
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentProduct = newCollectionArray[indexPath.row]
        switch collectionView {
        case productsCollection:
            if let productDeailsVC = storyboard?.instantiateViewController(withIdentifier: K.productDetailsVCid) as? ProductsDetailsVC {
                productDeailsVC.productDetails = currentProduct
                productDeailsVC.title = currentProduct.title
                productDeailsVC.currentRow = indexPath.row
                navigationController?.pushViewController(productDeailsVC, animated: true)
            }
            
        default:
            collectionView.deselectItem(at: indexPath , animated: true)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width , height = collectionView.frame.height
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            return CGSize(width: width / 4, height: height * 0.8)
            
        case self.productsCollection :
            
            if islist == true {
                convertCollectionGridOutlet.setImage(UIImage(named: "list"), for: .normal)
                return CGSize(width: width , height: height / 4)
            } else {
                convertCollectionGridOutlet.setImage(UIImage(named: "grid"), for: .normal)
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



// MARK: - Custom Delegate


extension NewCollectionVC: FavoriteDelegateProtocol{
    
    func didFavoriteTapped(row: Int) {
        newCollectionArray[row].isFavorite.toggle()
        saveMyFavoritesInCoreData(row: row)
    }
    
    
    func didXbuttonTapped(favRow: Int) {
        // this button is hidden in this view controller
    }
    
    
}

//Filtering data
extension NewCollectionVC: UsenigSortingFilterProtocol{
    func didUserTappDoneOrCancelButton(tabBar: UITabBar?) {
        //
    }
    
    
    func didUserUseingFilter(name: String) {
        orderBtnOutlet.titleLabel?.text = " \(name)"
        orderBtnOutlet.sizeToFit()
    }
}

extension NewCollectionVC: UsenigColorFilterProtocol{
    func didUserTappCancelOrDoneButton(tabBar: UITabBar?) {
        //
    }
    
    func didUserUseingColorFilter(name: String?, color: UIColor?) {
        if name != ""{
            filterBtnOutlet.setTitle(name, for: .normal)
        }else{
            filterBtnOutlet.setTitle("Filter", for: .normal)
        }
    }
  
    
    
}





