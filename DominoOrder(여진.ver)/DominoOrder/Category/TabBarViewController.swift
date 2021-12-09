//
//  TabBarViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    func setTabBar() {
        let categoryVC = UINavigationController(rootViewController: CategoryViewController())
        categoryVC.tabBarItem.title = "Category"
        categoryVC.tabBarItem.image = UIImage(named: "domino's.png")
        //self.navigationItem.title = "Domino's"
        
        
        let wishListVC = UINavigationController(rootViewController: WishListViewController())
        wishListVC.tabBarItem.title = "Wish List"
        wishListVC.tabBarItem.image = UIImage(named: "wishlist.png")
        
        viewControllers = [categoryVC, wishListVC]
    }


}

