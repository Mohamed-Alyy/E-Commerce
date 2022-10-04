//
//  Constants.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 11/09/2022.
//

import Foundation
import UIKit

class K {
    
    // MARK: - Api urls
    
    static let  urlAddNewUser = "https://fakestoreapi.com/users"
    static let  urlUserLogin  = "https://fakestoreapi.com/auth/login"
    static let  urlGetAllProducts = "https://fakestoreapi.com/products"
    static let  urlGetAllCarts = "https://fakestoreapi.com/carts"

    
    
    // MARK: - Constant property
    
    
    // some assets images names
    static let notFavoriteImage = UIImage(named: "favorite")
    static let isFavoriteImage = UIImage(named: "favorite.fill")
    static let shoppingBagImage = UIImage(named: "circleBagWhite")
    static let shoppingBagRedImage = UIImage(named: "circleBagRed")
    static let listImage = UIImage(named: "list")
    static let gridImage = UIImage(named: "gird")
    
    // Product Details Notification names properties
    static let favoriteNotificationName = "com.favoriteNotification"
    static let productIsFavoriteNotificationfName = "productIsFavorite"
    static let productIdNotificationfName = "productId"
//    static let rowIdNotificationfName = "rowId"
    static let senFavoiteToMyFavoriteArrayNotificationName = "myFavoritesArray"
    static let sendFinalMyFavArrayNotificationName = "finalMyFavoriteArray"
    
    
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
    static let homeCollectionVCid = String(describing: HomeCollectionVC.self)
    static let newCollectionVCid = String(describing: NewCollectionVC.self)
    static let collectionTabBarid = String(describing: CollectionTabBC.self)
    static let sortByVCid = String(describing: SortByVC.self)
    static let messgeVCid = String(describing: ChatListVC.self)
    static let filterVCid = String(describing: FilterColorVC.self)
    static let chatVCid = String(describing: MessegesVC.self)
    static let productDetailsVCid = String(describing: ProductsDetailsVC.self)
    static let selectSizeVCid = String(describing: SelesctSizeVC.self)
    static let sortingByVCid = String(describing: SortingByVC.self)
    static let shopingBagVCid = String(describing: ShoppingBagVC.self)
    static let favoriteVCid = String(describing: MyFavoritesVC.self)
}
