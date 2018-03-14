//
//  LoadingViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 2/22/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class LoadingViewController: SuperViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //prep welcome animation
        UIView.animate(withDuration: 3, animations: {
            self.view.backgroundColor = .green
        }) { _ in
            //dismiss self and navi to landing
            self.finishAnimate()
        }
    }
    
    func finishAnimate() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.presentMainController()
    }
}
