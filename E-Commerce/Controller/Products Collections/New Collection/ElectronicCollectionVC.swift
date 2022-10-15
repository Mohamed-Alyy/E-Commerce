//
//  NewCollectionVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 10/09/2022.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView
import Alertift
import Alamofire


class ElectronicCollectionVC: UIViewController {
    
    
    // MARK: - OUTLETS
    @IBOutlet weak var subCategoriesCollection: UICollectionView!
    @IBOutlet weak var productsCollection: UICollectionView!
    @IBOutlet weak var convertCollectionGridOutlet: UIButton!
    
    @IBOutlet weak var filterBtnOutlet: UIButton!
    @IBOutlet weak var orderBtnOutlet: UIButton!
    
   
    
    
    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    var productsCollectionArray:[Product] = []
 
    var islist = true


    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProsucstCell()
        getProductsFromApi()
      

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
    

    func getProductsFromApi () {
        showLoader()
        ApiCall.fetchData(url: K.urlproducts, method: .get, parameter: nil, headers: nil, encoding: nil) {[weak self]( products: Products?, error) in
            guard let self = self else {return}
            defer{
                self.hideLoadr()
            }
            if let error{
                print(error)
            }else{
                self.productsCollectionArray = (products?.data.products)!
                print(self.productsCollectionArray.count)
                self.productsCollection.reloadData()
            }
        }
    }
    
    func addOrRemoveFavorite(row: Int){
        let parameter = ["product_id": productsCollectionArray[row].id]
        
        ApiCall.fetchData(url: K.urlFavorites, method: .post, parameter: parameter, headers: K.authorizHeaders, encoding: nil) { (data: BaseResponse<AddOrDelFavorie>?, error) in
            if error != nil {
                // show alert error message
                Alertift.alert(title: "", message: data?.message)
                    .action(.default("تم"))
                    .show(on: self)
            }else{
                // show alert add or delete message
                
                Alertift.alert(title: "", message: data?.message)
                    .action(.default("تم"))
                    .show(on: self)
              
            }
        }
    }

 
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
    

    
}


// MARK: - Collection View Extension

extension ElectronicCollectionVC:Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
            
        case self.subCategoriesCollection :
            return subCategoriescolleectionArray.count
            
        case self.productsCollection :
            return productsCollectionArray.count
          
        default:
            return 0
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idSubCategoriesColltionIdCell, for: indexPath) as? SubCategoriesCollectionViewCell {
                cell.newCollectionLBL.text = subCategoriescolleectionArray[indexPath.row]
                return cell
            }
    
            default:
            let currentProduc = productsCollectionArray[indexPath.row]
                if islist {

                    if let lisetCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListProductionCollectionCell, for: indexPath) as? ListProductsCollectionViewCell {
                        
                        lisetCell.titleLBL.text = currentProduc.name
                        lisetCell.priceLBL.text = "$ \(currentProduc.price)"
                        lisetCell.descriptionLBL.text = "\(currentProduc.description)"
                        // use extension EXuiimageVie with Kingfisher to load image
                        lisetCell.productImage.loadImage(url: currentProduc.image)
    
                        // hide x button
                        lisetCell.xBtnOUtlet.isHidden = true

                        lisetCell.cellRow = indexPath.row
                        lisetCell.delegate = self

                        // set favorite button image
                        if currentProduc.inFavorites!{
                            lisetCell.favoriteBtn.setImage(K.isFavoriteImage, for: .normal)
                        }else{
                            lisetCell.favoriteBtn.setImage(K.notFavoriteImage, for: .normal)
                        }

                        return lisetCell
                    }
                }else{
                    if let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridCollectionCell, for: indexPath) as? GridCollectionViewCell{
                       
                        gridCell.priceLBL.text = "$ \(currentProduc.price)"
                        gridCell.produtsTitlLBL.text = currentProduc.name
                        gridCell.descriptionLBL.text = currentProduc.description
                        gridCell.productImageView.loadImage(url: currentProduc.image)

                        // hide x button
                        gridCell.xBtnOutlet.isHidden = true

                        gridCell.cellRow = indexPath.row

                        return gridCell
                    }
                }
            }

        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentProduct = productsCollectionArray[indexPath.row]
        switch collectionView {
        case productsCollection:
            if let productDeailsVC = storyboard?.instantiateViewController(withIdentifier: K.productDetailsVCid) as? ProductsDetailsVC {
                productDeailsVC.productDetails = productsCollectionArray[indexPath.row]
                productDeailsVC.title = currentProduct.name
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


extension ElectronicCollectionVC: FavoriteDelegateProtocol{
    
    func didFavoriteTapped(row: Int) {
        addOrRemoveFavorite(row: row)
          
    }
    
    
    func didXbuttonTapped(favRow: Int) {
        // this button is hidden in this view controller
    }
    
    
}

//Filtering data
extension ElectronicCollectionVC: UsenigSortingFilterProtocol{
    func didUserTappDoneOrCancelButton(tabBar: UITabBar?) {
        //
    }
    
    
    func didUserUseingFilter(name: String) {
        orderBtnOutlet.titleLabel?.text = " \(name)"
        orderBtnOutlet.sizeToFit()
    }
}

extension ElectronicCollectionVC: UsenigColorFilterProtocol{
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





