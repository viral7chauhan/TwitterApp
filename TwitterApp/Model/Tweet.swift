//
//  TweetUser.swift
//  TwitterApp
//
//  Created by Viral Chauhan on 22/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let tweetMessage: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.tweetMessage = json["message"].stringValue
    }
}
