//
//  ProductsVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 14/09/2022.
//

import UIKit

class ProductsDetailsVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var productDetailsImagesCollectionView: UICollectionView!
    @IBOutlet weak var suggestedProductsCollectionView: UICollectionView!

    
    @IBOutlet weak var addToCartBtnOutlet: UIButton!
    
    @IBOutlet weak var sizeView: UIView!{
        didSet{
            sizeView.layer.borderWidth = 1
            sizeView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var colorView: UIView!{
        didSet{
            colorView.layer.borderWidth = 1
            colorView.layer.cornerRadius = 10
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
            // set tabBarControlle title
        tabBarController?.title = "Product Details"
            // hide the bottom tab bar that contain tabBar bottom items
        tabBarController?.tabBar.isHidden = true
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
    }
    
    override func viewDidLayoutSubviews() {
        Helper.customViews(views: [addToCartBtnOutlet], cornerRadius: nil)
    }
    
    
    

    // MARK: - Properties
    
    var productDetailsImagesArray = [#imageLiteral(resourceName: "man") , #imageLiteral(resourceName: "flower") , #imageLiteral(resourceName: "massage") ]
    
    var suggestedProductsImagesArray = [#imageLiteral(resourceName: "candles") , #imageLiteral(resourceName: "candles"), #imageLiteral(resourceName: "candles") , #imageLiteral(resourceName: "candles") ]
    
    
    
    
    // MARK: - Actions
    
    @IBAction func sizeBtnPressed(_ sender: UIButton) {
        if let selectedSizeVC = storyboard?.instantiateViewController(withIdentifier: K.selectSizeVCid) as? SelesctSizeVC {
            
            selectedSizeVC.modalPresentationStyle = .overFullScreen
            selectedSizeVC.modalTransitionStyle = .crossDissolve
            selectedSizeVC.view.backgroundColor = .black.withAlphaComponent(0.5)
            present(selectedSizeVC, animated: true)
        }
        
    }
    
    
    @IBAction func colorBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    
    
    // MARK: - Functions
    
    func registerCell(){
        productDetailsImagesCollectionView.register(UINib(nibName: K.idProductDetailsCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idProductDetailsCollectionCell)
        productDetailsImagesCollectionView.delegate=self
        productDetailsImagesCollectionView.dataSource=self
        
        suggestedProductsCollectionView.register(UINib(nibName: K.idGridCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridCollectionCell)
        suggestedProductsCollectionView.delegate=self
        suggestedProductsCollectionView.dataSource=self
    }
  

}




// MARK: - Extensions

extension ProductsDetailsVC : Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case productDetailsImagesCollectionView:
            return productDetailsImagesArray.count
        case suggestedProductsCollectionView:
            return suggestedProductsImagesArray.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productDetailsImagesCollectionView :
            if let productsCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idProductDetailsCollectionCell, for: indexPath) as? ProductsDetailsCollectionViewCell {
                productsCell.produtImageView.image = productDetailsImagesArray[indexPath.row]
                return productsCell
            }
            
        case suggestedProductsCollectionView:
            if let suggestedCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridCollectionCell, for: indexPath) as? GridCollectionViewCell {
               
                suggestedCell.gridCollectionImageView.image = suggestedProductsImagesArray[indexPath.row]
                return suggestedCell
            }
            
        default:
            return UICollectionViewCell()
        }
       
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        switch collectionView{
        case productDetailsImagesCollectionView:
            return CGSize(width: width * 0.75, height: height)
        case suggestedProductsCollectionView:
            return CGSize(width: width / 2 , height: height)
        default:
            return CGSize(width: width , height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView{
        case productDetailsImagesCollectionView:
            return 0
        //case suggestedProductsCollectionView:
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView{
        case productDetailsImagesCollectionView:
            return 0
        //case suggestedProductsCollectionView:
            
        default:
            return 0
        }
    }
}
