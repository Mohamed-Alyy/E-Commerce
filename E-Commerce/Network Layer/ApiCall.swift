//
//  ApiCall.swift
//  E-Commerce
//
//  Created by Mohamed Ali on 03/10/2022.
//

import Foundation
import Alamofire

struct ApiCall {
    
    static func fetchData <Model: Codable> (url: String , method: HTTPMethod , parameter: Parameters?, headers: HTTPHeaders? , completion: @escaping (_ data:Model? , _ error: Error?)->Void){
        
        AF.request(url, method: method, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Model.self) { response in
            
            switch response.result{
                
            case .success(let data):
                completion(data,nil)
            case.failure(let error):
                completion(nil,error)
            }
        }
        
    }
}
