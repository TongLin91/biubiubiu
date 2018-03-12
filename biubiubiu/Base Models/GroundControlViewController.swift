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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helper = GroundControlHelper(self)
//        createSampleUser()
        fetchUserInfo()
    }
    
    func fetchUserInfo() {
        Auth.auth().signInAnonymously { (_, error) in
            if let description = error {
                print(description.localizedDescription)
                self.toLanding()
            } else {
                self.ref = Database.database().reference()
                self.ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
                    if let value = snapshot.value, let user = BiuUser.parsingUser(value) {
                        self.helper.currentUser = user
                        dump(user)
                        // To Lobby
                        self.toLobby()
                    } else {
                        self.toLanding()
                    }
                    
                }) { (error) in
                    self.toLanding()
                    print(error.localizedDescription)
                }
            }
        }
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
