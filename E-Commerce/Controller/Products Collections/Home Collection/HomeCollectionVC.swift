//
//  HomeCollectionVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 01/09/2022.
//

import UIKit

class HomeCollectionVC: UIViewController {
    
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var newCollectionImageArray: [UIImage] = [UIImage(named: "candles")! ,UIImage(named: "flower")! ,UIImage(named: "massage")!]
    
    var newCollectionTitle: [String] = ["New Collection","Summer Sales","Mean's Hoodies"]

    
    
    // MARK: - App Display FUnctions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = true
        tabBarController?.title = "Collections Home"
    }
    
    
    
    // MARK: - Functions
    
    func registerCell (){
        homeCollectionView.register(UINib(nibName:K.idHomeCollectionIdCell, bundle: nil), forCellWithReuseIdentifier: K.idHomeCollectionIdCell)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }

}


    // MARK: - Extensions

extension HomeCollectionVC:Typealias.collectionView_DataSourece_Delegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newCollectionImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idHomeCollectionIdCell, for: indexPath) as! HomeCollectionViewCell
        cell.homeCollectionImageView.image = newCollectionImageArray[indexPath.row]
        cell.homeCollectionLBL.text = newCollectionTitle[indexPath.row]
        cell.homeCollectionLBL.backgroundColor = .black.withAlphaComponent(0.45)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let newCollectionVC = storyboard?.instantiateViewController(withIdentifier: K.newCollectionVCid) as! NewCollectionVC
            
            newCollectionVC.title = newCollectionTitle[indexPath.row]
            //newCollectionVC.navigationItem.backButtonTitle = "للخلف"
            
            
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
