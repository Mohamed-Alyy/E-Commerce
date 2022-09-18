//
//  NewCollectionVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 10/09/2022.
//

import UIKit

class NewCollectionVC: UIViewController {
    
    
    
    
    // MARK: - OUTLETS
    @IBOutlet weak var subCategoriesCollection: UICollectionView!
    @IBOutlet weak var productsCollection: UICollectionView!
    @IBOutlet weak var convertCollectionGridOutlet: UIButton!
    
    @IBOutlet weak var filterBtnOutlet: UIButton!
    @IBOutlet weak var orderBtnOutlet: UIButton!
    
    
    
    // MARK: - Proerties
    
    var subCategoriescolleectionArray = ["T-Shirt" , "Crop Tops" , "Sleeveless" , "Blouses"]
    
    var productsCollectionArray = [UIImage(named: "man"),UIImage(named: "man"),UIImage(named: "man"),UIImage(named: "man"),UIImage(named: "man"),UIImage(named: "man")]
    
    var islist = true
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerSubCategoriesCell()
        registerNewCollectionCells()
        
        
        //navigationItem.backBarButtonItem = backBtn
    }
    
   
    
    // MARK: - Actions
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        if let filterVC = storyboard?.instantiateViewController(withIdentifier: K.filterVCid) as? FilterVC{
            filterVC.modalPresentationStyle = .overFullScreen
            filterVC.modalTransitionStyle = .crossDissolve
            
            filterVC.view.backgroundColor = .black.withAlphaComponent(0.5)
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
    
    
    
    // MARK: - Functions

    func registerSubCategoriesCell () {
        subCategoriesCollection.register(UINib(nibName: K.idShubCategoriesColltionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idShubCategoriesColltionIdCell)
        subCategoriesCollection.dataSource=self
        subCategoriesCollection.delegate=self
        
    }
    
    func registerNewCollectionCells() {
        productsCollection.register(UINib(nibName: K.idListProductionCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idListProductionCollectionCell)
       
        productsCollection.register(UINib(nibName: K.idGridCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idGridCollectionCell)
        
        productsCollection.dataSource=self
        productsCollection.delegate=self
        
    }
    
    
    
    @IBAction func convertCollectionGridBtnPressed(_ sender: UIButton) {
        islist = !islist
        productsCollection.reloadData()
        print(islist)
    }
    
}


extension NewCollectionVC:Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case self.subCategoriesCollection :
            return subCategoriescolleectionArray.count
            
        case self.productsCollection :
            return productsCollectionArray.count
        default:
            return subCategoriescolleectionArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.subCategoriesCollection :
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idShubCategoriesColltionIdCell, for: indexPath) as? SubCategoriesCollectionViewCell {
                
                cell.newCollectionLBL.text = subCategoriescolleectionArray[indexPath.row]
                return cell
            }
            
        default:
            if islist {
                if let liseCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idListProductionCollectionCell, for: indexPath) as? ListProductsCollectionViewCell {
                    
                    liseCell.productsCollImageView.image = productsCollectionArray[indexPath.row]
                    return liseCell
                }
            }else{
                if let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idGridCollectionCell, for: indexPath) as? GridCollectionViewCell{
                    
                    gridCell.gridCollectionImageView.image = productsCollectionArray[indexPath.row]
                    return gridCell
                }
            }
            
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case productsCollection:
            if let productDeailsVC = storyboard?.instantiateViewController(withIdentifier: K.productDetailsVCid) as? ProductsDetailsVC {
                
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

extension NewCollectionVC: UsenigSortingFilterProtocol{
    func didUserUseingFilter(name: String) {
        orderBtnOutlet.titleLabel?.text = " \(name)"
        orderBtnOutlet.sizeToFit()
       // orderBtnOutlet.titleLabel?.autoresizesSubviews = true
       // orderBtnOutlet.titleLabel?.translatesAutoresizingMaskIntoConstraints = true
        //orderBtnOutlet.titleLabel?.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
    }
}


