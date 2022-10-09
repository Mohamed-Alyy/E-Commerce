//
//  HomeCollectionVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 01/09/2022.
//

import UIKit
import Alamofire

class CategoriesVC: UIViewController {
    
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // MARK: - properties
    var categoryArray: [Category] = []
    
 
    // MARK: - App Display FUnctions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getCategoriesFromApi()

    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = true
        tabBarController?.title = "Categoeis"
    }
    
    
    
    // MARK: - Functions
    
    
    func registerCell (){
        categoryCollectionView.register(UINib(nibName:K.idHomeCollectionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idHomeCollectionIdCell)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func getCategoriesFromApi(){
        showLoader()
        ApiCall.fetchData(url: K.urlCategories, method: .get, parameter: nil, headers: nil) {[weak self]( categoris: Categories?, error) in
            guard let self = self else {return}
            defer{
                self.hideLoadr()
            }
            if let error{
                print(error)
            }else{
                self.categoryArray = (categoris?.data.categories)!
                self.categoryCollectionView.reloadData()
                
            }
        }
    }
    
 

}


    // MARK: - Extensions

extension CategoriesVC:Typealias.collectionView_DataSourece_Delegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idHomeCollectionIdCell, for: indexPath) as! HomeCollectionViewCell
        cell.homeCollectionImageView.loadImage(url: categoryArray[indexPath.row].image)
       
        cell.homeCollectionLBL.text = categoryArray[indexPath.row].name
        cell.homeCollectionLBL.textColor = .yellow
        cell.homeCollectionLBL.backgroundColor = .black.withAlphaComponent(0.7)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let newCollectionVC = storyboard?.instantiateViewController(withIdentifier: K.newCollectionVCid) as! NewCollectionVC
            
            newCollectionVC.title = categoryArray[indexPath.row].name
            navigationController?.pushViewController(newCollectionVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width , height = collectionView.frame.height
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: height / 2)
        default:
            return CGSize(width: width / 2, height: height / 2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets.zero
    }
}
