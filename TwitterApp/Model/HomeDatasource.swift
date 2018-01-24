//
//  HomeDatasource.swift
//  TwitterApp
//
//  Created by Viral Chauhan on 19/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T:JSONDecodable>() throws -> [T] {
        return try map{ try T(json:$0) }
    }
}


class HomeDatasource : Datasource, JSONDecodable {
    
    var users: [User]
    var tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let userJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "api.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey : "Parsing json object was invalid"])
        }
        
//        self.users = userJsonArray.map({ return User(json: $0)})
//        self.tweets = tweetJsonArray.map({ return Tweet(json: $0) })
        self.users = try userJsonArray.decode()
        self.tweets = try tweetJsonArray.decode()
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
