//
//  GroundControlViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class GroundControlViewController: UIViewController {
    
    let nfcHelper = NFCHelper()
    var helper: GroundControlHelper!
    var ref: DatabaseReference!
    @IBOutlet weak var biuTabBar: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helper = GroundControlHelper(self)
        self.toLanding()
        self.fetchUserInfo()
    }
    
    func fetchUserInfo() {
        Auth.auth().signInAnonymously { (_, error) in
            if let description = error {
                print(description.localizedDescription)
                self.blockingUnknowUser()
            } else {
                self.ref = Database.database().reference()
                self.ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
                    if let value = snapshot.value, let user = BiuUser.parsingUser(value) {
                        self.helper.currentUser = user
                        self.toLobby()
                        return
                    }
                    self.blockingUnknowUser()
                }) { (error) in
                    print(error.localizedDescription)
                    self.blockingUnknowUser()
                }
            }
        }
    }
    
    func blockingUnknowUser() {
        
    }
    
    func toLanding() {
        let landing = LandingViewController(nibName: "LandingViewController", bundle: nil)
        helper.push(landing)
    }
    
    func toLobby() {
        let lobby = LobbyViewController(nibName: "LobbyViewController", bundle: nil)
        helper.push(lobby)
    }
    
    func createSampleUser() {
        let user = BiuUser(name: "Master", invitedBy: "me")
        
        ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).updateChildValues(user.dictionary)
    }
    
}
