//
//  HomeDatasourceViewController.swift
//  TwitterApp
//
//  Created by Viral Chauhan on 19/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceViewController : DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Appologics, Somthing went wrong. Please try again later.."
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems ()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)

        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA component
        
        Service.sharedInstance.fetchHomeFeeds { (homeDatasource, error) in
            if let err = error {
                self.errorMessageLabel.isHidden = false
                print("error while fetching json data")
                
                if let er = err as? APIError<Service.JSONError> {
                    self.errorMessageLabel.text = "Status code \(er.response?.statusCode ?? 0)"
                }
            }
            self.datasource = homeDatasource
        }
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
            return CGSize(width: view.frame.width, height: estimateHeightOfText(user.bioText) + 66)
           
        } else if indexPath.section == 1 {
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else { return .zero }
            return CGSize(width: view.frame.width, height: estimateHeightOfText(tweet.tweetMessage) + 74)
        }
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    private func estimateHeightOfText(_ text: String) -> CGFloat {
        
        let approximateWidthOfBioTextView = view.frame.width - 50 - 12 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
   
}

