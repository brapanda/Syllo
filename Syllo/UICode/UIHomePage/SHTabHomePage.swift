//
//  SHTabHomePage.swift
//  Syllo
//
//  Created by Shawn on 2016-02-02.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit

class SHTabHomePage: SHThreeColumn{
    var segmentedControl = UISegmentedControl(items: ["style1","style2"])
    override func viewDidLoad() {
        super.viewDidLoad()
        //using SHCollectionView
//        self.stackedLayout.layoutMargin = UIEdgeInsetsZero
//        self.exposedLayoutMargin = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
//        self.collectionView?.backgroundColor = UIColorFromRGB(0x992299)
        
        // Do any additional setup after loading the view.
        
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.frame = CGRectMake(0, 0, 100, 30)
        var barButton = UIBarButtonItem(customView: segmentedControl)
//        self.segmentedControl.addTarget(self, action: "switchStyle", forControlEvents: .ValueChanged)
        self.navigationItem.titleView = segmentedControl
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func switchStyle(sender: UISegmentedControl){
//        switch sender{
//        case 0:
//            break
//        case 1:
//            break
//        default: break
//        }
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
