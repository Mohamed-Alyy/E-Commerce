//
//  ShoppingBagVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 22/09/2022.
//

import UIKit

class CartVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var subCategoriesCollection: UICollectionView!
    
    @IBOutlet weak var convertCollectionGridBtnOutlet: UIButton!
    
    @IBOutlet weak var myCartCollection : UICollectionView!
    
    @IBOutlet weak var promoCodeTF: UITextField!
    
    @IBOutlet weak var checkOutBtnOutlet: UIButton!
    @IBOutlet weak var totalAmountLBL: UILabel!
    @IBOutlet weak var totalPriceLBL: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "My Bag"
        tabBarController?.tabBar.selectedItem?.title = ""
        getCartFormApi()
    }

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.customViews(views: [promoCodeTF , checkOutBtnOutlet], cornerRadius: nil)
        registerCell()
        
    }
    
    

    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    var myCartArray: CartData?
    var islist = true
   // var totalPrice = 0.0
    
    // MARK: - Actions
    
    @IBAction func convertCollectionGridBtnPressed(_ sender: UIButton) {
        islist = !islist
        myCartCollection.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func checkOutBtnPressed(_ sender: UIButton) {
        
    }

    // MARK: - Functions
    func removeFromCart(row: Int){
        let currentItemId = myCartArray?.cartItems[row].product.id
        let parameter = ["product_id": currentItemId] as? [String: Any]
        ApiCall.fetchData(url: K.urlCart, method: .post, parameter: parameter, headers: K.authorizHeaders, encoding: nil) { (data: AddOrDeletFromCart?, error) in
            if error != nil {
                print(error as Any)
            }else{
                print(data?.message as Any)
            }
        }
    }
    
    
    func getCartFormApi(){
        showLoader()
        ApiCall.fetchData(url: K.urlCart, method: .get, parameter: nil, headers: K.authorizHeaders, encoding: nil) {[weak self] (cart: MyCartModel?, error )in
            guard let self = self else {return}
            defer{
                self.hideLoadr()
            }
            if error != nil {
                print(error as Any)
            }else{
                if  cart?.data != nil {
                    self.myCartArray = (cart?.data)!
                    self.myCartCollection.reloadData()

                }
               
            }
        }
    }
    
    
    func registerCell(){
        subCategoriesCollection.register(UINib(nibName: K.idSubCategoriesColltionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idSubCategoriesColltionIdCell)
        myCartCollection.register(UINib(nibName: K.idListBagCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idListBagCollectionCell)
        myCartCollection.register(UINib(nibName: K.idGridBagCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridBagCollectionCell)
        
        subCategoriesCollection.delegate=self
        subCategoriesCollection.dataSource=self
        myCartCollection.delegate=self
        myCartCollection.dataSource=self
        
    }
   

}


extension CartVC: Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case self.subCategoriesCollection :
            return subCategoriescolleectionArray.count
            
        case self.myCartCollection :
            if let cartCount = myCartArray?.cartItems.count {
                return cartCount
            }
            //return (myCartArray?.cartItems.count)
        default:
            return 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let currentIndex = myCartArray?.cartItems[indexPath.row].product
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
                  
                    if let currentIndex {
                        lisetCell.titleLBL.text = currentIndex.name
                        lisetCell.priceLBL.text = "$\(currentIndex.price)"
                        lisetCell.descriptionLBL.text = currentIndex.description
                        lisetCell.bagImage.loadImage(url: currentIndex.image)
                        if let total = myCartArray?.total{totalPriceLBL.text = "$\(total.rounded())"}
                        
                        
                        lisetCell.delegate = self
                        lisetCell.cartRow = indexPath.row
                        return lisetCell
                    }
                }
            }else{
                // return GridBagCollection
                convertCollectionGridBtnOutlet.setImage(UIImage(named: "grid"), for: .normal)
                if let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridBagCollectionCell, for: indexPath) as? GridBagCollectionViewCell{
                    
                    if let currentIndex {
                        gridCell.titleLBL.text = currentIndex.name
                        gridCell.priceLBL.text = "$\(currentIndex.price)"
                        gridCell.descriptionLBL.text = currentIndex.description
                        gridCell.productImage.loadImage(url: currentIndex.image)
                        if let total = myCartArray?.total{totalPriceLBL.text = "$\(total.rounded())"}
                        
                        return gridCell
                    }
                }
            }
            
            
        }
        myCartCollection.reloadData()
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width , height = collectionView.frame.height
        
        switch collectionView {
            
        case self.subCategoriesCollection :
            return CGSize(width: width / 4, height: height * 0.8)
            
        case self.myCartCollection :
            
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

extension CartVC: DeleteFromCartProtocol {
    func didXbuttonTapped(cartRow: Int) {
        removeFromCart(row: cartRow)
        myCartArray?.cartItems.remove(at: cartRow)
        myCartCollection.reloadData()
        
    }
    
   
    
    
}
