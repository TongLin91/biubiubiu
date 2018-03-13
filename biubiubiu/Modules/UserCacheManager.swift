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
    private let key = "bbbUserInfoExtractionKey"
    static let shared = UserCacheManager()
    init() {}
    
    private func saveUserData(_ data: Any?) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadUserData() -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    func fetchUserData() {
        let ref = Database.database().reference()
        ref.child("BiuPlayer").child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
            self.saveUserData(snapshot.value)
        }) { (error) in
            print(error.localizedDescription)
            //TODO block user
        }
    }
}
