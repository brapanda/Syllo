//
//  SHTabShowPage.swift
//  Syllo
//
//  Created by Shawn on 2016-02-02.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit

class SHTabShowPage: NTWaterfallViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.setCollectionViewLayout(CHTCollectionViewWaterfallLayout(), animated: false)
        // Do any additional setup after loading the view.
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