//
//  UserCacheManager.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/13/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit

final class UserCacheManager {
    static private let userInfoKey = "bbbUserInfoExtractionKey"
    
    static func loadUserData() -> Any? {
        return UserDefaults.standard.object(forKey: userInfoKey)
    }
    
    static func saveUserData(_ data: Any?) {
        UserDefaults.standard.set(data, forKey: userInfoKey)
    }
}
