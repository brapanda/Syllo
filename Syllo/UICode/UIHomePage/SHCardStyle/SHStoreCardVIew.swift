//
//  SHStoreCardVIew.swift
//  Syllo
//
//  Created by Shawn on 2016-02-07.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit

class SHStoreCardView: UIView{
    var screenSize = UIScreen.mainScreen().bounds
    var storeInfo = UIButton(type: UIButtonType.InfoDark)
    var cardWidth : CGFloat!
    var cardHeight : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cardWidth = screenSize.width - 10
        cardHeight = 400
        setStyle()
        setButton()
    }
    
    func setStyle() {
        //set frame
        self.frame.origin = CGPoint(x: 5, y: 0)
        self.frame.size   = CGSize(width: cardWidth, height: cardHeight)
        
        
        self.opaque = false
        self.backgroundColor = UIColor.clearColor()
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.shadowOffset = CGSize(width: 20, height: 20)
        self.layer.shadowColor  = UIColor.blackColor().CGColor
    }
    
    func setButton(){
        
        storeInfo.frame.origin = CGPoint(x: self.frame.size.width - 30, y: cardHeight - 30)
        storeInfo.frame.size = CGSize(width: 20, height: 20)
        storeInfo.tintColor = UIColor.grayColor()
        self.addSubview(storeInfo)
        //        storeInfo.addTarget(self, action: "switchToStoreInfoView", forControlEvents: .TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}