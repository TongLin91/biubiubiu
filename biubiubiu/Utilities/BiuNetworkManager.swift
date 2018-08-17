//
//  BiuNetworkManager.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/16/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

final class BiuNetworkManager {
    
    static private let dbRef = Database.database().reference()
    static private let userRootRef = "BiuPlayer"
    static private let roomRootRef = "BiuRooms"
    
    static func fetchUserInfo(_ completion: @escaping (BiuResponse)->()) {
        dbRef.child(userRootRef).child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                completion(BiuResponse(error: nil, data: snapshot.value))
            } else {
                completion(BiuResponse(error: BiuError.noData, data: nil))
            }
        }) { (error) in
            completion(BiuResponse(error: BiuError.other(with: error.localizedDescription), data: nil))
        }
    }
    
    static func registerNewUser(_ newUser: BiuUser, completion: @escaping (BiuResponse)->()) {
        dbRef.child(userRootRef).child(UIDevice.current.identifierForVendor!.uuidString).setValue(newUser.dictionary) { (error, _) in
            
            if let error = error {
                completion(BiuResponse(error: BiuError.other(with: error.localizedDescription), data: nil))
                return
            }
            completion(BiuResponse(error: nil, data: newUser))
        }
    }
    
    static func fetchAllRooms(_ completion: @escaping (BiuResponse)->()) {
        dbRef.child(roomRootRef).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                completion(BiuResponse(error: nil, data: snapshot.value))
            } else {
                completion(BiuResponse(error: BiuError.noData, data: nil))
            }
        }) { (error) in
            completion(BiuResponse(error: BiuError.other(with: error.localizedDescription), data: nil))
        }
    }
}

struct BiuResponse {
    let error: BiuError?
    let data: Any?
}

enum BiuError: Error {
    case noData
    case other(with: String)
}
