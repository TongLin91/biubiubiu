//
//  BiuUser.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class BiuUser: NSObject, Codable {
    var displayName: String?
    var dateJoined: Date?
    var invitedBy: String?
    var avatar: String?
    var friendList: [String] = []
    
    private enum CodingKeys: String, CodingKey {
        case displayName
        case dateJoined
        case invitedBy
        case avatar
        case friendList
    }
    
    override init() {
        super.init()
    }
}
