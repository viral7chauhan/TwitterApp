//
//  TwitteCell.swift
//  TwitterApp
//
//  Created by Viral Chauhan on 22/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweetUser = datasourceItem as? Tweet else {
                return
            }
            profileImageView.loadImage(urlString: tweetUser.user.profileImageUrl)
            
            let attributedString = NSMutableAttributedString(string: tweetUser.user.name, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
            
            let tweetUsername = " \(tweetUser.user.username)\n"
            attributedString.append(NSAttributedString(string: tweetUsername, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor : UIColor.gray]))
            
            let paragraphAttribute = NSMutableParagraphStyle()
            paragraphAttribute.lineSpacing = 4
            let range = NSMakeRange(0, attributedString.string.count)
            attributedString.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphAttribute], range: range)
            
            attributedString.append(NSAttributedString(string: tweetUser.tweetMessage, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]))
            
            tweetTextView.attributedText = attributedString;
        }
    }
    
    let replyButton: UIButton = {
       let reply = UIButton(type: .system)
        reply.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return reply
    }()
    
    let retweetButton: UIButton = {
        let retweet = UIButton(type: .system)
        retweet.setImage(#imageLiteral(resourceName: "refresh").withRenderingMode(.alwaysOriginal), for: .normal)
        return retweet
    }()
    
    let favoriteButton: UIButton = {
        let fav = UIButton(type: .system)
        fav.setImage(#imageLiteral(resourceName: "favorite").withRenderingMode(.alwaysOriginal), for: .normal)
        return fav
    }()
    
    let messageButton: UIButton = {
        let message = UIButton(type: .system)
        message.setImage(#imageLiteral(resourceName: "send").withRenderingMode(.alwaysOriginal) , for: .normal)
        return message
    }()
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "ProfileImage")
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let tweetTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Sample texts"
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(tweetTextView)
        
        
        tweetTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        setupBottomStackView()
    }
    
    fileprivate func setupBottomStackView() {
        
        let replyButtonContainer = UIView()
        let retweetButtonContainer = UIView()
        let favoriteButtonContainer = UIView ()
        let messageButtonContainer = UIView()
        
        let stackView = UIStackView(arrangedSubviews: [replyButtonContainer, retweetButtonContainer, favoriteButtonContainer, messageButtonContainer])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(nil, left: tweetTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(favoriteButton)
        addSubview(messageButton)
        
        replyButton.anchor(replyButtonContainer.topAnchor, left: replyButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainer.topAnchor, left: retweetButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        favoriteButton.anchor(favoriteButtonContainer.topAnchor, left: favoriteButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        messageButton.anchor(messageButtonContainer.topAnchor, left: messageButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

    }
    
}
