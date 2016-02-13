//
//  SHTabShowPage.swift
//  Syllo
//
//  Created by Shawn on 2016-02-02.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit

class SHCardCollectionView: TGLStackedViewController {
    var doubleTapToClose : Bool = false
    var cards = [UIColor.yellowColor(),UIColor.grayColor(),UIColor.greenColor(),UIColor.redColor(),UIColor.yellowColor(),UIColor.grayColor(),UIColor.greenColor(),UIColor.yellowColor(),UIColor.grayColor(),UIColor.greenColor(),UIColor.yellowColor(),UIColor.grayColor(),UIColor.greenColor(),UIColor.yellowColor(),UIColor.grayColor(),UIColor.greenColor()]
    var screenSize = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Set to NO to prevent a small number
        // of cards from filling the entire
        // view height evenly and only show
        // their -topReveal amount
        //
        self.stackedLayout.fillHeight = true
        
        // Set to NO to prevent a small number
        // of cards from being scrollable and
        // bounce
        //
        self.stackedLayout.alwaysBounce = true
        
        // Set to NO to prevent unexposed
        // items at top and bottom from
        // being selectable
        //
        self.unexposedItemsAreSelectable = true
        
        if (self.doubleTapToClose){
            let recognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleDoubleTap")
            recognizer.delaysTouchesBegan = true
            recognizer.numberOfTapsRequired = 2
            
            self.collectionView?.addGestureRecognizer(recognizer)
        }
        
        self.collectionView?.registerClass(SHStoreCell.self, forCellWithReuseIdentifier: "CardCell")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer){
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("cell")
        let cell  = collectionView.dequeueReusableCellWithReuseIdentifier("CardCell", forIndexPath: indexPath) as! SHStoreCell
        cell.roundedView.backgroundColor = UIColor.whiteColor()//cards[indexPath.row]
        cell.storeInfo.addTarget(self, action: "switchToStoreInfoView", forControlEvents: .TouchUpInside)
//        cell.roundedView = SHStoreCardView(frame: CGRect(x: 5, y: 0, width: screenSize.width - 10, height: 400))
        return cell
    }
    
    func switchToStoreInfoView(){
        let storeInfoView = SHStoreInfoView()
        storeInfoView.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.navigationController?.pushViewController(storeInfoView, animated: true)
        
    }
    
    
    override func moveItemAtIndexPath(fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {
        let card = self.cards[fromIndexPath.row]
        self.cards.removeAtIndex(fromIndexPath.row)
        self.cards.insert(card, atIndex: toIndexPath.row)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}