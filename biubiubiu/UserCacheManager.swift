//
//  UserCacheManager.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/13/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class UserCacheManager {
    private let dbRef = Database.database().reference()
    private let userRootRef = "BiuPlayer"
    private let userInfoKey = "bbbUserInfoExtractionKey"
    static let shared = UserCacheManager()
    init() {}
    
    func loadUserData() -> Any? {
        return UserDefaults.standard.object(forKey: userInfoKey)
    }
    
    func createNewUser(_ invitedBy: String, completion: @escaping (Error?)->()) {
        let newUser = BiuUser(name: "my name", invitedBy: invitedBy)
        dbRef.child(userRootRef).child(UIDevice.current.identifierForVendor!.uuidString).setValue(newUser.dictionary) { (error, _) in
            if error != nil {
                self.saveUserData(newUser.dictionary)
            }
            completion(error)
        }
    }
    
    func fetchUserData(_ completion: @escaping (Bool)->()) {
        dbRef.child(userRootRef).child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                self.saveUserData(snapshot.value)
                completion(true)
            } else {
                completion(false)
            }
        }) { (error) in
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    private func saveUserData(_ data: Any?) {
        UserDefaults.standard.set(data, forKey: userInfoKey)
    }
}
