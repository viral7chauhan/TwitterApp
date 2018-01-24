//
//  Service.swift
//  TwitterApp
//
//  Created by Viral Chauhan on 23/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeeds (completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Success fetch json")
            print(homeDatasource.users.count)
            completion(homeDatasource, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
    
    class JSONError : JSONDecodable {
        required init(json: JSON) throws {
            print("Error case ")
        }
    }
}
