//
//  Constants.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 11/09/2022.
//

import Foundation
import UIKit
import Alamofire

class K {
    
    // MARK: - API Parameters
    static let token = UserDefaults.standard.value(forKey: "token")
   
    
    // "Duiz17HwzeeXiDDNzJdv2rovgKN8tMaM95sFBh1ARZ6VxX9HpLBrUb4yqGw2Ym8rjwGw16"
    // MARK: - APi Headers
    static  let authorizHeaders: HTTPHeaders = ["Authorization": token as! String, "lang": "ar"]
    
    
    
    // MARK: - Api urls
    
    static let urlBase = "https://student.valuxapps.com/api/"
    static let urlLogin =  urlBase+"login"
    static let urlLogout = urlBase+"logout"
    static let urlRegister  = urlBase+"register"
    static let urlProfile = urlBase+"profile"
    static let urlproducts = urlBase+"products"
    static let urlCategories = urlBase+"categories"
    static let urlFavorites = urlBase+"favorites"
    static let urlCart = urlBase+"carts"
    


    enum URLS: String {
        case register
        case login
        case logout
        case profile
        case products
        case favorites
        case carts
        case categories
    }
    
    
    
    
    // MARK: - Constant property
    
    
    // some assets images names
    static let notFavoriteImage = UIImage(named: "favorite")
    static let isFavoriteImage = UIImage(named: "favorite.fill")
    
    static let isCartImage = UIImage(named: "circleBagWhite")
    static let notCartImage = UIImage(named: "circleBagRed")
    
    static let listImage = UIImage(named: "list")
    static let gridImage = UIImage(named: "gird")
    
    // Product Details Notification names properties
    static let changeImageNotificationName = "com.imageNotification"


    
    // MARK: - Storyborads Ids
    
    static let mainStoryboardId = "Main"
    static let productiosStoryboardId = "Products"
    
    // MARK: - Collections Cells Ids
    
    static let idHomeCollectionIdCell = String(describing: HomeCollectionViewCell.self)
    static let idSubCategoriesColltionIdCell = String(describing: SubCategoriesCollectionViewCell.self)
    static let idListProductionCollectionCell = String(describing: ListProductsCollectionViewCell.self)
    static let idGridCollectionCell = String(describing: GridCollectionViewCell.self)
    static let idColorsCollectionCell = String(describing: ColorsCollectionViewCell.self)
    static let idCategoryCollectionCell = String(describing: CategoryCollectionViewCell.self)
    static let idProductDetailsCollectionCell = String(describing: ProductsDetailsCollectionViewCell.self)
    static let idSelesctSizeCollectionCell = String(describing: SelectSizeCollectionViewCell.self)
    static let idSortingByCollectionCell = String(describing: SortingByCollectionViewCell.self)
    static let idListBagCollectionCell = String(describing: ListBagCollectionViewCell.self)
    static let idGridBagCollectionCell = String(describing: GridBagCollectionViewCell.self)
    
    
    
    
    // MARK: - Table View Cells Ids
    
    static let idMessegesTableViewCell = String(describing: MessegesTableViewCell.self)
    static let idChatTableViewCell = String(describing: ChatTableViewCell.self)
    
    
    
    
    // MARK: - View Controllers Ids
    
    static let signiInVCid = String(describing: SignInVC.self)
    static let loginVCid = String(describing: LogInVC.self)
    static let forgotPassVCid = String(describing: ForgotPasswordVC.self)
    static let homeCollectionVCid = String(describing: CategoriesVC.self)
    static let newCollectionVCid = String(describing: ElectronicCollectionVC.self)
    static let collectionTabBarid = String(describing: CollectionTabBC.self)
    static let sortByVCid = String(describing: SortByVC.self)
    static let messgeVCid = String(describing: ChatListVC.self)
    static let filterVCid = String(describing: FilterColorVC.self)
    static let chatVCid = String(describing: MessegesVC.self)
    static let productDetailsVCid = String(describing: ProductsDetailsVC.self)
    static let selectSizeVCid = String(describing: SelesctSizeVC.self)
    static let sortingByVCid = String(describing: SortingByVC.self)
    static let cartVCid = String(describing: CartVC.self)
    static let favoriteVCid = String(describing: MyFavoritesVC.self)
}
