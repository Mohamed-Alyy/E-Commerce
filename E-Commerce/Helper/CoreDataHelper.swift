//
//  CoreDataHelper.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 27/09/2022.
//



import Foundation
import CoreData
import UIKit

//@objc(Cart)
//public class Cart: NSManagedObject {
//
//}

struct CoreDataHelper{
    
    static  func saveFavoiteToCoreData(product: ProductsModel){
        // create new object in Entity (table)
        let object = NSEntityDescription.insertNewObject(forEntityName: "Cart", into: manageContext) as! Cart
       
        // set object proerties (values)
        object.id = Int16(product.id)
        object.price = Int16(product.price)
        object.title = product.title
        object.descripe = product.description
        object.isFavorite = product.isFavorite

        //Convert image string to data to save it in core data
        object.image = Helper.convertStrinToData(image: product.image)
        
        
        // save data
        do{
            try  manageContext.save()
        }catch{
            print(error.localizedDescription)
        }
       
            
        }
    
    
    static func fetchDataFromCoreData() -> [ProductsModel]{
        var myFavArray = [ProductsModel]()
        let fetch = Cart.fetchRequest()
        
        do{
            let results = try manageContext.fetch(fetch)
            
            for result in results {
             
                if let image = result.image{
                    let stringImage = Helper.converDataToString(image: image)
                    
                    let newFav = ProductsModel(id: Int(result.id), price: Int(result.price), title: result.title!, image: stringImage, description: result.descripe!)
                    myFavArray.append(newFav)
                    
                }  
            }
        }catch{
            print(error.localizedDescription)
        }
        return myFavArray
    }
    
    static func deleteObjectFromCoreData (index: Int) {
        let fetch = Cart.fetchRequest()
        do{
            let results = try manageContext.fetch(fetch)
            let objectForDelete = results[index]
            manageContext.delete(objectForDelete)
            try manageContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    static func updateObjectInCoreData(model object : ProductsModel , index objectIndex: Int) {
        let fetch = Cart.fetchRequest()
        do{
            let results = try manageContext.fetch(fetch)
            let currentObject = results[objectIndex]
            currentObject.id = Int16(object.id)
            currentObject.title = object.title
            currentObject.descripe = object.description
            currentObject.price = Int16(object.price)
            currentObject.image = Helper.convertStrinToData(image: object.image)
            try manageContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
