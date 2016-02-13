//
//  SHStoreCell.swift
//  Syllo
//
//  Created by Shawn on 2016-02-05.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class SHStoreCell: UICollectionViewCell{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var screenSize = UIScreen.mainScreen().bounds
    var roundedView : UIView!
    var color : UIColor!
    var cardWidth : CGFloat!
    var cardHeight: CGFloat!
    var storeInfo = UIButton(type: UIButtonType.InfoDark)
    var storeLogo = UIImageView()
    var imageList = ["dentist.jpg","meijia.jpeg","shoppers.jpg","tatoo.jpg","loblaws.jpg"]
    func randomImage() -> String{
        var imageNo = arc4random_uniform(5)
        return imageList[Int(imageNo)]
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cardWidth = screenSize.width - 10
        cardHeight = 400
        roundedView = UIView()
        
        setStyle()
        setButton()
        setCellColor()
        setImage()
        self.contentView.addSubview(roundedView)
        
        
    }
    func setStyle() {
        //set frame
        roundedView.frame.origin = CGPoint(x: 5, y: 0)
        roundedView.frame.size   = CGSize(width: cardWidth, height: cardHeight)
        
        
        self.opaque = false
        self.backgroundColor = UIColor.clearColor()
        
        self.roundedView.backgroundColor = self.color
        self.roundedView.layer.cornerRadius = 10.0
        self.roundedView.layer.borderWidth = 0.5
        self.roundedView.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.shadowOffset = CGSize(width: 20, height: 20)
        self.layer.shadowColor  = UIColor.blackColor().CGColor
    }
    
    func setImage(){
        storeLogo.frame.origin = CGPoint(x: 0, y: 0)
        storeLogo.frame.size = CGSize(width: cardWidth, height: 150)
        storeLogo.contentMode = UIViewContentMode.ScaleAspectFill
        storeLogo.roundCorners(UIRectCorner.TopLeft, radius: 10)
        storeLogo.layer.masksToBounds = true
        let storeImage = UIImage(named: randomImage())
        storeLogo.image = storeImage
        self.roundedView.addSubview(storeLogo)
        
    }
    
    func setButton(){
        
        storeInfo.frame.origin = CGPoint(x: cardWidth - 30, y: cardHeight - 30)
        storeInfo.frame.size = CGSize(width: 20, height: 20)
        storeInfo.tintColor = UIColor.grayColor()
        self.roundedView.addSubview(storeInfo)
//        storeInfo.addTarget(self, action: "switchToStoreInfoView", forControlEvents: .TouchUpInside)
    }
    
    func switchToStoreInfoView(){
//        let storeInfoView = SHStoreInfoView()
//        storeInfoView.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        
    }
    
    func setCellColor(){
        self.roundedView.backgroundColor = self.color
    }
    
    func setWhenSelected(selected: Bool) {
        super.selected = selected
        self.roundedView.layer.borderColor = self.selected ? UIColor.whiteColor().CGColor : UIColor.blackColor().CGColor
    }
}

