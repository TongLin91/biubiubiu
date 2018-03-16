//
//  BiuUser.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class BiuUser: SuperModule {
    var displayName: String?
    var dateJoined: Date?
    var lastTimeStamp: Date?
    var invitedBy: String?
    var avatar: String?
//    var friendList: [String] = []
    
    private enum CodingKeys: String, CodingKey {
        case displayName
        case dateJoined
        case lastTimeStamp
        case invitedBy
        case avatar
    }
    
    init(name: String, invitedBy: String) {
        super.init()
        self.displayName = name
        self.dateJoined = Date()
        self.lastTimeStamp = Date()
        self.invitedBy = invitedBy
        self.avatar = ""
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}


