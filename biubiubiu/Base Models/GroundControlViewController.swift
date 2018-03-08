//
//  GroundControlViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class GroundControlViewController: UIViewController {
    
    var helper: GroundControlHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helper = GroundControlHelper(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initLandingVC()
    }
    
    func initLandingVC() {
        let landing = LandingViewController(nibName: "LandingViewController", bundle: nil)
        helper.push(landing)
    }
}
