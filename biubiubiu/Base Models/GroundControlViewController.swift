//
//  GroundControlViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit
import FirebaseDatabase

class GroundControlViewController: UIViewController {
    
    var helper: GroundControlHelper!
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helper = GroundControlHelper(self)
        
        ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapShot) in
            if let value = snapShot.value {
                // skip landing
            }
            
            self.initNewUserView()
            
        }) { (error) in
            self.initNewUserView()
            print(error.localizedDescription)
        }
    }
    
    func initNewUserView() {
        let landing = LandingViewController(nibName: "LandingViewController", bundle: nil)
        helper.push(landing)
    }
}
