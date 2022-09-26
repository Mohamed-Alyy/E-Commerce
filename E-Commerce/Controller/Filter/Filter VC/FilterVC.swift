//
//  FilterVC.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 13/09/2022.
//

import UIKit

class FilterVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var filerBgView: UIView!
    @IBOutlet weak var colorsBgView: UIView!
    @IBOutlet weak var categoryBgView: UIView!
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Helper.customViews(views: [filerBgView , colorsBgView , categoryBgView], cornerRadius: nil)
        registerCell()
    }
    
    // MARK: - Properties
    
    var colorsArray = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) , #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) , #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) , #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) , #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) , #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) , #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) , #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) , #colorLiteral(red: 0, green: 0.6783193946, blue: 0.6451055408, alpha: 1) ]
    
    var categoryNamesArray = ["All","Men","Women","Boys","Girls"]
    
    
    
    // MARK: - Actions
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        filterAlert()
    }
    
    
    
    // MARK: - Functions
    func registerCell () {
        colorsCollectionView.register(UINib(nibName: K.idColorsCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idColorsCollectionCell)
        colorsCollectionView.delegate=self
        colorsCollectionView.dataSource=self
        categoryCollectionView.register(UINib(nibName: K.idCategoryCollectionCell, bundle: nil), forCellWithReuseIdentifier: K.idCategoryCollectionCell)
        categoryCollectionView.delegate=self
        categoryCollectionView.dataSource=self
        
    }

    func filterAlert () {
        let alert = UIAlertController(title: "Confirm Filter", message: "are you sure to use filter", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            //self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    
 
}

// MARK: - Extensions

extension FilterVC: Typealias.collectionView_DataSourece_Delegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case colorsCollectionView:
            return colorsArray.count
        default:
            return categoryNamesArray.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case colorsCollectionView:
            if let colorCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idColorsCollectionCell, for: indexPath) as? ColorsCollectionViewCell {
                colorCell.backgroundColor = colorsArray[indexPath.row]
                
                return colorCell
            }
        default:
            if let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idCategoryCollectionCell, for: indexPath) as? CategoryCollectionViewCell {
                //colorCell.colorView.backgroundColor = colorsArray[indexPath.row]
                categoryCell.categoryLBL.text = categoryNamesArray[indexPath.row]
                return categoryCell
            }
        }
       
        return UICollectionViewCell()
    }
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width , height = collectionView.frame.height
        if collectionView == categoryCollectionView {

            return CGSize(width: width / 3  , height: height  / 2  )
        }else{
            return CGSize(width: 25    , height: 25 )

        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoryCollectionView {
            return 0
        }else{
            return 16
        }
        

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoryCollectionView {
            return 0
        }else{
            return 16
        }
            }
        
}
