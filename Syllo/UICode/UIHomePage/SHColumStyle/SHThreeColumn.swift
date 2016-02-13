//
//  SHThreeColumn.swift
//  Syllo
//
//  Created by Shawn on 2016-02-09.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit

enum displayType {
    case threePieces, twoPieces
    
    init(){
        self = .threePieces
    }
}
class SHThreeColumn: UICollectionViewController, UINavigationControllerDelegate,RAReorderableLayoutDelegate, RAReorderableLayoutDataSource {
    var RACollectionView   : UICollectionView!
    var superNavigationBar : UINavigationBar!
    var superTabBar        : UITabBar!
    var collectionViewType = displayType.init()
    var selectedCell       = SHCollectionViewCell()
    var scoreView          = UIView()
    
    var imagesForSection0: [UIImage] = []
    var imagesForSection1: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.collectionView?.backgroundColor = homeBackgroundColor
        self.collectionView?.pagingEnabled = true
        let layout = RAReorderableLayout()
        let viewOrigin = CGPoint(x: 0, y: 0)
        let viewSize = CGSize(width: screenSize.width, height: screenSize.height - 49 - 64)
        RACollectionView = UICollectionView(frame: CGRect(origin: viewOrigin, size: viewSize), collectionViewLayout: layout)

        self.RACollectionView!.registerClass(SHCollectionViewCell.self, forCellWithReuseIdentifier: "verticalCell")
        self.RACollectionView.delegate = self
        self.RACollectionView.dataSource = self
        
        for index in 0..<18 {
            let name = "loblaws.jpg"
            let image = UIImage(named: name)
            self.imagesForSection0.append(image!)
        }
        for index in 18..<30 {
            let name = "loblaws.jpg"
            let image = UIImage(named: name)
            self.imagesForSection1.append(image!)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.RACollectionView!.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0)
    }

    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        print("willshow navigation")
    }

    
    // RAReorderableLayout delegate datasource
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenWidth        = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let threePiecesWidth = floor(screenWidth / 3.0 - ((4.0 / 3) * 2))
        let twoPiecesWidth = floor(screenWidth / 2.0 - (4.0 / 2))
        switch collectionViewType{
        case .threePieces:
            return CGSizeMake(threePiecesWidth, threePiecesWidth / 3.0 * 4)
        case .twoPieces:
            return CGSizeMake(twoPiecesWidth, twoPiecesWidth / 3.0 * 4)
        }
        return CGSizeMake(threePiecesWidth, threePiecesWidth / 3.0 * 4)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 4.0
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 2.0, 0)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.imagesForSection0.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.RACollectionView.dequeueReusableCellWithReuseIdentifier("verticalCell", forIndexPath: indexPath) as! SHCollectionViewCell
        
        cell.imageView.image = self.imagesForSection0[indexPath.item]
        cell.layer.cornerRadius = 5
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        selectedCell = self.RACollectionView?.cellForItemAtIndexPath(indexPath) as! SHCollectionViewCell 
        
        openScoreView(selectedCell)
    }
    
    func collectionView(collectionView: UICollectionView, allowMoveAtIndexPath indexPath: NSIndexPath) -> Bool {
        if collectionView.numberOfItemsInSection(indexPath.section) <= 1 {
            return false
        }
        return true
    }
    
    func collectionView(collectionView: UICollectionView, atIndexPath: NSIndexPath, didMoveToIndexPath toIndexPath: NSIndexPath) {
        var photo: UIImage
        if atIndexPath.section == 0 {
            photo = self.imagesForSection0.removeAtIndex(atIndexPath.item)
        }else {
            photo = self.imagesForSection1.removeAtIndex(atIndexPath.item)
        }
        
        if toIndexPath.section == 0 {
            self.imagesForSection0.insert(photo, atIndex: toIndexPath.item)
        }else {
            self.imagesForSection1.insert(photo, atIndex: toIndexPath.item)
        }
    }
    
    func scrollTrigerEdgeInsetsInCollectionView(collectionView: UICollectionView) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, reorderingItemAlphaInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 0.3
        }
    }
    
    func scrollTrigerPaddingInCollectionView(collectionView: UICollectionView) -> UIEdgeInsets {
        return UIEdgeInsetsMake(self.RACollectionView.contentInset.top, 0, self.RACollectionView.contentInset.bottom, 0)
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        var moveOffset = scrollView.contentOffset.y
//        var navigationOriginY = superNavigationBar?.frame.origin.y
//        var hideNavigationBar : CGFloat = -44
//        if navigationOriginY == hideNavigationBar{
//            if moveOffset < 0{
//                if (moveOffset < 0) {
//                    moveOffset = 0
//                }
//                if (moveOffset > 94){
//                    moveOffset = 94
//                }
//                
//                superNavigationBar!.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -moveOffset)
//                superTabBar?.transform        = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, max(0,moveOffset - 15))
//            }
//        }else{
//            if (moveOffset < 0) {
//                moveOffset = 0
//            }
//            if (moveOffset > 94){
//                moveOffset = 94
//            }
//            
//            superNavigationBar!.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -moveOffset)
//            superTabBar?.transform        = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, max(0,moveOffset - 15))
//        }
//        if moveOffset < 35{
//            superNavigationBar!.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0)
//            superTabBar?.transform        = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0)
//        }
    }
    
    //scoreView help function
    func openScoreView(selectCell : SHCollectionViewCell){
//        scoreView.frame = selectCell.frame
//        scoreView.backgroundColor = UIColor.grayColor()
////        self.view.addSubview(scoreView)
//        let scale = JNWSpringAnimation(keyPath: "transform.translation.y")
//        scale.damping = 6
//        scale.stiffness = 100
//        scale.mass = 2
//        
//        scale.fromValue = 1
//        scale.toValue = 4
//        selectCell.layer.addAnimation(scale, forKey: scale.keyPath)
//        selectCell.transform = CGAffineTransformMakeScale(2, 2)
    }
    
}

class SHCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var titleView = UILabel()
    var gradientLayer: CAGradientLayer?
    var hilightedCover: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleView = UILabel(frame: CGRect(x: 0, y: self.bounds.size.height * 0.8, width: self.bounds.size.width, height: self.bounds.size.height * 0.2))
        self.titleView.alpha = 0.8
        self.titleView.textAlignment = .Center
        self.titleView.font = UIFont(name: "", size: 10)
        configure()
    }
    
    override var highlighted: Bool {
        didSet {
            self.hilightedCover.hidden = !self.highlighted
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = self.bounds
    
        self.hilightedCover.frame = self.bounds
        self.applyGradation(self.imageView)
    }
    
    private func configure() {
        self.imageView = UIImageView()
        self.imageView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 5.0
        self.addSubview(self.imageView)
        
        self.titleView.text = "Loblaws"
        self.titleView.tintColor = UIColor.blackColor()
        self.titleView.backgroundColor = UIColor.whiteColor()
        self.imageView.addSubview(titleView)
        
        self.hilightedCover = UIView()
        self.hilightedCover.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.hilightedCover.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.hilightedCover.hidden = true
        self.hilightedCover.layer.cornerRadius = 5.0
        self.addSubview(self.hilightedCover)
    }
    
    private func applyGradation(gradientView: UIView!) {
        self.gradientLayer?.removeFromSuperlayer()
        self.gradientLayer = nil
        
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer!.frame = gradientView.bounds
        
        let mainColor = UIColor(white: 0, alpha: 0.3).CGColor
        let subColor = UIColor.clearColor().CGColor
        self.gradientLayer!.colors = [subColor, mainColor]
        self.gradientLayer!.locations = [0, 1]
        
        gradientView.layer.addSublayer(self.gradientLayer!)
    }
}
