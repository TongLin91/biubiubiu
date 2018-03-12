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
    
    let nfcHelper = NFCHelper()
    var helper: GroundControlHelper!
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helper = GroundControlHelper(self)
//        createSampleUser()
        fetchUserInfo()
    }
    
    func fetchUserInfo() {
        ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value, let user = BiuUser.parsingUser(value) {
                dump(user)
                
            } else {
                self.initNewUserView()
            }
            
        }) { (error) in
            self.initNewUserView()
            print(error.localizedDescription)
        }
    }
    func initNewUserView() {
        let landing = LandingViewController(nibName: "LandingViewController", bundle: nil)
        helper.push(landing)
    }
    
    func createSampleUser() {
        let user = BiuUser(name: "Master", invitedBy: "me")
        
        ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).updateChildValues(user.dictionary)
    }
    
}
