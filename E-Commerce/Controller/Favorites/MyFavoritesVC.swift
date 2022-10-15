//
//  fFvoritesVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 17/09/2022.
//

import UIKit
import Alertift
import Alamofire

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
        getMyFavoritesFromApi()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
       
    }
    
    
    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    var myFavoritesArray: [MyFavorite] = []
    
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
    } //Function End
    
   
    func getMyFavoritesFromApi(){
        
        ApiCall.fetchData(url: K.urlFavorites, method: .get, parameter: nil, headers: K.authorizHeaders, encoding: nil) {[weak self] (favorites: MyFavoritesModel?, error) in
            guard let self = self else {return}
            defer{
                self.hideLoadr()
            }
            self.showLoader()
            if error != nil{
                Alertift.alert(title: "Error", message: "\(favorites?.status)")
                    .action(.default("تم"))
                    .show(on:self)

            }else{
                guard let favArr = favorites?.data?.favorites else {return}
               
                self.myFavoritesArray = favArr
                self.myFavoriteCollection.reloadData()
            }

        }
    }//Function End
    
    func addOrRemoveFavorite(row: Int){
        let parameter = ["product_id": myFavoritesArray[row].product?.id] as? [String: Any]
        
        ApiCall.fetchData(url: K.urlFavorites, method: .post, parameter: parameter, headers: K.authorizHeaders, encoding: JSONEncoding.default) { (myFavorites: BaseResponse<AddOrDelFavorie>?, error) in
            if error != nil {
                Alertift.alert(title: "", message: error?.localizedDescription)
                    .action(.default("تم"))
                    .show(on: self)
            }else{
                Alertift.alert(title: "", message: myFavorites?.message)
                    .action(.default("تم"))
                    .show(on: self)
              
            }
        }
    } //Function End
    
    
    
    func addOrRemoveFromCart(row: Int){
        let currentItemId = myFavoritesArray[row].product?.id
        let parameter = ["product_id": currentItemId] as? [String: Any]
        ApiCall.fetchData(url: K.urlCart, method: .post, parameter: parameter, headers: K.authorizHeaders, encoding: JSONEncoding.default) { (data: AddOrDeletFromCart?, error) in
            if error != nil {
            //    print(error)
                Alertift.Alert(title: "", message: error?.localizedDescription)
                    .action(.default("تم"))
                    .show(on: self)
            
            }else{
                Alertift.Alert(title: "", message: data?.message)
                    .action(.default("تم"))
                    .show(on: self)
            }
        }
    } // Function End
    
    
    
    
} // Class End




    // MARK: - Collection View Protocols

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
        } //Function End
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch collectionView{
                
            case myFavoriteCollection:
                let listFavCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListProductionCollectionCell, for: indexPath) as! ListProductsCollectionViewCell
                
                let currentFav = myFavoritesArray[indexPath.row].product
                
                if islist{
                    if let currentFav{
                        listFavCell.titleLBL.text = currentFav.name
                        listFavCell.descriptionLBL.text = currentFav.description
                        listFavCell.priceLBL.text = "$\(currentFav.price.rounded())"
                        listFavCell.productImage.loadImage(url: currentFav.image)
                        
                        listFavCell.cellRow = indexPath.row
                        listFavCell.delegate = self
                        
                        // set favorite button image
                        listFavCell.favoriteBtn.setImage(K.isCartImage, for: .normal)
                       
                        return listFavCell
                        
                    }
                    
                }else{
                    
                    let gridFavCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridCollectionCell, for: indexPath) as! GridCollectionViewCell
                    if let currentFav{
                        gridFavCell.produtsTitlLBL.text = currentFav.name
                        gridFavCell.descriptionLBL.text = currentFav.description
                        gridFavCell.priceLBL.text = "$\(currentFav.price.rounded())"
                        gridFavCell.productImageView.loadImage(url: currentFav.image)
                        
                        gridFavCell.cellRow = indexPath.row
                        gridFavCell.favoriteBtn.setImage(K.isCartImage, for: .normal)
                        
                        
                    }
                    // if user tap on x button
                    gridFavCell.xButtonTappedClousre = { [weak self ]row in
                       
                        self!.myFavoriteCollection.reloadData()
                       
                    }
                    
                    // if user tap on favorite button
                    gridFavCell.favoriteBtnTappedClousre = { [weak self] row in
                        guard let self = self else {return}
                        self.myFavoriteCollection.reloadData()
                        
                    }
                    return gridFavCell
                }
                
            default:
                let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSubCategoriesColltionIdCell, for: indexPath) as! SubCategoriesCollectionViewCell
                
                
                return categoryCell
            }
        
            return UICollectionViewCell()
        } //Function End
        
        
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
        } //Function End
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets.zero
        } //Function End
        
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
    } //Function End


    // MARK: - FavoriteDelegateProtocol protocol

extension MyFavoritesVC: FavoriteDelegateProtocol{
    
    // remove current favorite form myFavoriteArray if xButton Tapped
    func didXbuttonTapped(favRow: Int) {
        addOrRemoveFavorite(row: favRow)
        myFavoritesArray.remove(at: favRow)
        myFavoriteCollection.reloadData()
       
    } //Function End
    
    func didFavoriteTapped(row: Int) {
        addOrRemoveFromCart(row: row)
    
    } //Function End
    
    
} // Extension End


    // MARK: - UsenigSortingFilterProtocol protocol

extension MyFavoritesVC: UsenigSortingFilterProtocol{
    func didUserTappDoneOrCancelButton(tabBar: UITabBar?) {
        self.tabBarController?.tabBar.isHidden = false
        
    } //Function End
    
    func didUserUseingFilter(name: String) {
        priceOrderBtnOutlet.setTitle(name, for: .normal)
        
    } //Function End
    
    
} // Extension End

// MARK: - UsenigColorFilterProtocol protocol

extension MyFavoritesVC: UsenigColorFilterProtocol{
    func didUserTappCancelOrDoneButton(tabBar: UITabBar?) {
        self.tabBarController?.tabBar.isHidden = false
        
    } //Function End
    
    func didUserUseingColorFilter(name: String?, color: UIColor?) {
        if name != ""{
            filterBtnOutlet.setTitle(name, for: .normal)
        }else{
            filterBtnOutlet.setTitle("Filter", for: .normal)
        }
    } //Function End
    

    
} //Extension End
