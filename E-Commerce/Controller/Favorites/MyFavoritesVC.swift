//
//  fFvoritesVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 17/09/2022.
//

import UIKit

class MyFavoritesVC: UIViewController {

    
   @IBOutlet weak var convertCollectionGridOutlet: UIButton!
    
    @IBOutlet weak var priceOrderBtnOutlet: UIButton!
    
    @IBOutlet weak var filterBtnOutlet: UIButton!
    // MARK: - Outlets
    
    @IBOutlet weak var subCategoriesCollection: UICollectionView!
    @IBOutlet weak var myFavoriteCollection: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "My Favorites"
        tabBarController?.tabBar.selectedItem?.title = ""
        
        // Get array form core data
        myFavoritesArray =  CoreDataHelper.fetchDataFromCoreData()
        print("myFavoritesArray.count: ",myFavoritesArray.count)
        myFavoriteCollection.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        //reciveNotification()
    }
   
    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    var myFavoritesArray : [ProductsModel] = []
    
    var islist = true

    
    
    // MARK: - Actions
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        if let filterVC = storyboard?.instantiateViewController(withIdentifier: K.filterVCid) as? FilterColorVC{
            //hide tabBar before present to fix isu
            self.tabBarController?.tabBar.isHidden = true
            
            
            filterVC.delegate = self
            filterVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            filterVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            filterVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)

            present(filterVC, animated: true)
        }
    }
    
    
    @IBAction func priceOrderBtnPressed(_ sender: UIButton) {
        
        if let sortingVC = storyboard?.instantiateViewController(withIdentifier: K.sortingByVCid) as? SortingByVC {
           
            
            //hide tabBar before present
            self.tabBarController?.tabBar.isHidden = true
            print("Button Tapped")
            
            sortingVC.delegate = self
            sortingVC.modalTransitionStyle = .crossDissolve
            sortingVC.modalPresentationStyle = .overCurrentContext
            
            sortingVC.view.backgroundColor = .black.withAlphaComponent(0.7)
            
            present(sortingVC, animated: true)
        }
    }
    
    @IBAction func convertCollectionGridBtnPressed(_ sender: UIButton) {
        islist = !islist
        myFavoriteCollection.reloadData()
    }
    

    // MARK: - Functions

    
    
    // register collection view cells
    func registerCell(){
        subCategoriesCollection.register(UINib(nibName: K.idSubCategoriesColltionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idSubCategoriesColltionIdCell)
        myFavoriteCollection.register(UINib(nibName: K.idListProductionCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idListProductionCollectionCell)
        myFavoriteCollection.register(UINib(nibName: K.idGridCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridCollectionCell)
        
        subCategoriesCollection.delegate=self
        subCategoriesCollection.dataSource=self
        myFavoriteCollection.delegate=self
        myFavoriteCollection.dataSource=self
        
    }
   

}


    extension MyFavoritesVC: Typealias.collectionView_DataSourece_Delegate{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch collectionView{
            case self.subCategoriesCollection :
                return subCategoriescolleectionArray.count
                
            case self.myFavoriteCollection :
                return  myFavoritesArray.count
            default:
                return 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            switch collectionView{
                
            case myFavoriteCollection:
                let listFavCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListProductionCollectionCell, for: indexPath) as! ListProductsCollectionViewCell
                if islist{
                    listFavCell.titleLBL.text = myFavoritesArray[indexPath.row].title
                    listFavCell.priceLBL.text = "$ \(myFavoritesArray[indexPath.row].price)"
                    listFavCell.productImage.image = UIImage(named: myFavoritesArray[indexPath.row].image)
                    listFavCell.descriptionLBL.text = myFavoritesArray[indexPath.row].description
                    
                    listFavCell.cellRow = indexPath.row
                    listFavCell.delegate=self
                    
                    // set the bag photo
                    if myFavoritesArray[indexPath.row].isFavorite{
                        listFavCell.favoriteBtn.setImage(K.shoppingBagImage, for: .normal)
                    }else{
                        listFavCell.favoriteBtn.setImage(K.shoppingBagRedImage, for: .normal)
                    }
                    
                    return listFavCell
                    
                }else{
                    
                    let gridFavCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridCollectionCell, for: indexPath) as! GridCollectionViewCell
                    gridFavCell.produtsTitlLBL.text = myFavoritesArray[indexPath.row].title
                    gridFavCell.priceLBL.text = "$ \(myFavoritesArray[indexPath.row].price)"
                    gridFavCell.descriptionLBL.text = myFavoritesArray[indexPath.row].description
                    gridFavCell.productImageView.image = UIImage(named: myFavoritesArray[indexPath.row].image)
                    
                    gridFavCell.cellRow = indexPath.row
                    
                    gridFavCell.xButtonTappedClousre = { [weak self ]row in
                        self?.myFavoritesArray.remove(at: row)
                        self!.myFavoriteCollection.reloadData()
                    }
                    
                    
                    gridFavCell.favoriteBtnTappedClousre = { [unowned self] row in
                        let isFavorite =  self.myFavoritesArray[row].isFavorite
                        self.myFavoritesArray[row].isFavorite = !isFavorite
                        self.myFavoriteCollection.reloadData()
                    }
                    
                    // set the bag photo
                    if myFavoritesArray[indexPath.row].isFavorite{
                        gridFavCell.favoriteBtn.setImage(K.shoppingBagImage, for: .normal)
                    }else{
                        gridFavCell.favoriteBtn.setImage(K.shoppingBagRedImage, for: .normal)
                    }
                    
                    return gridFavCell
                }
                
            default:
                let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSubCategoriesColltionIdCell, for: indexPath) as! SubCategoriesCollectionViewCell
                
                
                return categoryCell
            }
        

        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width = collectionView.frame.width , height = collectionView.frame.height
            
            switch collectionView {
                
            case self.subCategoriesCollection :
                return CGSize(width: width / 4, height: height * 0.8)
                
            case self.myFavoriteCollection :
                
                if islist == true {
                    convertCollectionGridOutlet.setImage(UIImage(named: "list"), for: .normal)
                    return CGSize(width: width , height: height / 4)
                } else {
                     convertCollectionGridOutlet.setImage(UIImage(named: "grid"), for: .normal)
                    return CGSize(width: width / 2  , height: height * 0.55)
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


extension MyFavoritesVC: FavoriteDelegateProtocol{
    
    // remove current favorite form myFavoriteArray if xButton Tapped
    func didXbuttonTapped(favRow: Int) {
        //myFavoritesArray.remove(at: favRow)
        CoreDataHelper.deleteObjectFromCoreData(index: favRow)
        myFavoritesArray = CoreDataHelper.fetchDataFromCoreData()
        print("myFavoritesArray.count: ",myFavoritesArray.count)
        myFavoriteCollection.reloadData()
    }
    
    
    
    func didFavoriteTapped(row: Int) {
        
        //change isFavorite value in array
        myFavoritesArray[row].isFavorite.toggle()
        myFavoriteCollection.reloadData()
        
    }
}


extension MyFavoritesVC: UsenigSortingFilterProtocol{
    func didUserTappDoneOrCancelButton(tabBar: UITabBar?) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func didUserUseingFilter(name: String) {
        priceOrderBtnOutlet.setTitle(name, for: .normal)
    }
    

    
    
}

extension MyFavoritesVC: UsenigColorFilterProtocol{
    func didUserTappCancelOrDoneButton(tabBar: UITabBar?) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func didUserUseingColorFilter(name: String?, color: UIColor?) {
        if name != ""{
            filterBtnOutlet.setTitle(name, for: .normal)
        }else{
            filterBtnOutlet.setTitle("Filter", for: .normal)
        }
    }
    

    
}
