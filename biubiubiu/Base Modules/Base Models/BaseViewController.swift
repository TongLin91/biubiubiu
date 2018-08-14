//
//  BaseViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 2/22/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewAppearanceSetup()
    }
    
    func viewAppearanceSetup() {
        self.view.backgroundColor = .lightGray
        self.tabBarController?.tabBar.isHidden = false
    }
}
