//
//  HomeDatasourceController+NavItems.swift
//  TwitterApp
//
//  Created by Viral Chauhan on 22/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import UIKit

extension HomeDatasourceViewController {
    
    func setupNavigationBarItems() {
     
        setupRemainigNavItem()
        setupLeftNavItem()
        setupRightNavItems()
    }
    
    fileprivate func setupRightNavItems() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action:nil)
        let composeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.compose, target: self, action: nil)
        navigationItem.rightBarButtonItems = [composeButton, searchButton]
    }
    
    fileprivate func setupLeftNavItem() {
        let followButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: nil)
        navigationItem.leftBarButtonItem = followButton
    }
    
    fileprivate func setupRemainigNavItem() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "twitterFollow"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let topSeparatorView = UIView()
        topSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        self.view.addSubview(topSeparatorView)
        
        topSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 00, widthConstant: 0, heightConstant: 0.5)
    }
    
    
}
