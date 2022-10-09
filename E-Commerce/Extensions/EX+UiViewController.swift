//
//  EX+UiViewController.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 09/10/2022.
//

import Foundation
import UIKit
import NVActivityIndicatorViewExtended


extension UIViewController: NVActivityIndicatorViewable {
    
   
   
    func showLoader(){
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: "Looding", type: .ballScaleMultiple, color: .yellow)
    }
   // let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
    
    func hideLoadr(){
            DispatchQueue.main.async {
                self.stopAnimating()
            }
    }
}
