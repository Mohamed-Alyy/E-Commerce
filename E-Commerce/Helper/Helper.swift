//
//  Helper.swift
//  Twuiq Final Project
//
//  Created by Mohamed Ali on 17/08/2022.
//

import Foundation
import UIKit


struct Helper {
    
    
    static func imageFromUrlString (image: String , completion:(_ image: UIImage?)-> Void) {
        var photo: UIImage?

        if let imageUrl = URL(string: image) {
            do{
                let imgeData =  try Data(contentsOf: imageUrl)
                photo = UIImage(data: imgeData)
            }catch{
                print(error)
            }

        }
        completion(photo)
    }
    
    
    

    static func alert (view: UIViewController , title: String , messege: String , okActionTitle: String? , cancelActionTitle: String?) {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
            let okAction = UIAlertAction(title: okActionTitle, style: .default)
            alert.addAction(okAction)
        
        if let cancel = cancelActionTitle{
            let cancelAction = UIAlertAction(title: cancel, style: .cancel)
            alert.addAction(cancelAction)
        }
            
            
            view.present(alert, animated: true)
    }
    
    static func customViews (views: [UIView], cornerRadius: CGFloat?) {
        if cornerRadius != nil {
            for view in views {
                view.layer.cornerRadius = view.layer.frame.height * cornerRadius!
                view.layer.shadowColor =  UIColor.lightGray.cgColor
                view.layer.shadowRadius = CGFloat(3)
                view.layer.shadowOffset = CGSize(width: 0, height: 3)
                view.layer.shadowOpacity = 0.7
            }
           
        } else{
            for view in views {
                view.layer.cornerRadius = view.layer.frame.height * 0.1
                view.layer.shadowColor =  UIColor.lightGray.cgColor
                view.layer.shadowRadius = CGFloat(3)
                view.layer.shadowOffset = CGSize(width: 0, height: 3)
                view.layer.shadowOpacity = 0.7
            }
        }
    }
    
    

}
