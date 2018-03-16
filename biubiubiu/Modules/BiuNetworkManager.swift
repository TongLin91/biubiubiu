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

class BiuNetworkManager {
    static let shared = BiuNetworkManager()
    
    private let dbRef = Database.database().reference()
    private let userRootRef = "BiuPlayer"
    private let roomRootRef = "BiuRooms"
    
    func fetchUserInfo(_ completion: @escaping (BiuResponse)->()) {
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
    
    func registerNewUser(_ newUser: BiuUser, completion: @escaping (BiuResponse)->()) {
        dbRef.child(userRootRef).child(UIDevice.current.identifierForVendor!.uuidString).setValue(newUser.dictionary) { (error, _) in
            if error != nil {
                completion(BiuResponse(error: nil, data: newUser))
            } else {
                completion(BiuResponse(error: BiuError.other(with: error!.localizedDescription), data: nil))
            }
        }
    }
    
    func fetchAllRooms(_ completion: @escaping (BiuResponse)->()) {
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
