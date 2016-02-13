//
//  SHMainFrame.swift
//  Syllo
//
//  Created by Shawn on 2016-02-02.
//  Copyright © 2016 syllo. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    public override func childViewControllerForStatusBarHidden() -> UIViewController? {
        return self.topViewController
    }
    
    public override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return self.topViewController
    }
}

class SHMainFrame: UITabBarController {
    
    let navigationColor = UIColorFromRGB(0xffffff)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = navigationColor
        addTabs()
    }
    
    func addTabs(){
        
        let tabHomePage = SHThreeColumn(collectionViewLayout: RAReorderableLayout())
        tabHomePage.superNavigationBar = self.navigationController?.navigationBar
        tabHomePage.superTabBar = self.tabBar
        let navNavigationPage1 = UINavigationController(rootViewController:tabHomePage)
        navNavigationPage1.title = "Home";
        navNavigationPage1.navigationBar.barTintColor = navigationColor
        
        let tabSearchPage = SHTabShowPage(collectionViewLayout: CHTCollectionViewWaterfallLayout())
        let navNavigationPage2 = NTNavigationController(rootViewController:tabSearchPage)
        navNavigationPage2.title = "Show";
        navNavigationPage2.navigationBar.barTintColor = navigationColor
        
        let tabMePage = SHTabMePage(nibName: nil, bundle: nil)
        let navNavigationPage3 = UINavigationController(rootViewController:tabMePage)
        navNavigationPage3.title = "Me";
        navNavigationPage3.navigationBar.barTintColor = navigationColor
        
        self.viewControllers = [navNavigationPage1,navNavigationPage2,navNavigationPage3];
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
