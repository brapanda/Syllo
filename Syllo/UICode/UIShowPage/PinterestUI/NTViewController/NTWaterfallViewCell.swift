//
//  NTWaterfallViewCell.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 6/30/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import UIKit

class NTWaterfallViewCell :UICollectionViewCell, NTTansitionWaterfallGridViewProtocol{
    var imageName : String?
    var imageViewContent : UIImageView = UIImageView()
    var textView : UILabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageViewContent)
        contentView.addSubview(textView)
        self.layer.cornerRadius = 5
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.frame = CGRectMake(0,frame.size.height - 50, frame.size.width,50)
        textView.text = "傻逼傻逼大傻逼"
        textView.textAlignment = .Center
        textView.backgroundColor = waterFallCellText
        textView.alpha = 1.0
        textView.layer.masksToBounds = true
        textView.roundCorners([.BottomLeft, .BottomRight], radius: 5)
        
        imageViewContent.frame = CGRectMake(0, 0, frame.size.width, frame.size.height - 50)
        imageViewContent.image = UIImage(named: imageName!)
        imageViewContent.contentMode = UIViewContentMode.ScaleAspectFill
        imageViewContent.layer.masksToBounds = true
        imageViewContent.roundCorners([.TopLeft,.TopRight], radius: 5)
        
    }
    
    func snapShotForTransition() -> UIView! {
        let snapShotView = UIImageView(image: self.imageViewContent.image)
        snapShotView.frame = imageViewContent.frame
        return snapShotView
    }
}