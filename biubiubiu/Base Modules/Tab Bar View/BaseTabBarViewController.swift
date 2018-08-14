//
//  BaseTabBarViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/31/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

enum TabBarIndex: Int {
    
    case home, contact
    
    init(int:Int) {
        switch int {
        case 0:  self = .home
        case 1:  self = .contact
        default: self = .home
        }
    }
}

class BaseTabBarViewController: UITabBarController {
    
    var previousIndex: TabBarIndex = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        delegate = self
        
        let homeVC = ChatWireframe().viewController
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
        let contactVC = ContactWireframe().navigationController!
        contactVC.tabBarItem =  UITabBarItem(title: "Contacts", image: nil, selectedImage: nil)
        let profileVC = ProfileWireframe().navigationController!
        profileVC.tabBarItem =  UITabBarItem(title: "Me", image: nil, selectedImage: nil)
        
        viewControllers = [homeVC, contactVC, profileVC]
    }
}

extension BaseTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        previousIndex = TabBarIndex.init(int: tabBarController.selectedIndex)
        return true
    }
}
