//
//  APIController.swift
//  fiap-beer-app
//
//  Created by Luiz Valdemar on 7/15/17.
//  Copyright © 2017 Luiz Valdemar. All rights reserved.
//

import Foundation
import Alamofire

class APIController {
    
    static func loadBeers(handler: @escaping ([NSDictionary]) -> Void) {
        
        Alamofire.request("https://api.punkapi.com/v2/beers").responseJSON { response in
            
            if let result = response.result.value {
                let datasource = result as! [NSDictionary]
                handler(datasource)
            }
            
        }
        
    }
    
}
