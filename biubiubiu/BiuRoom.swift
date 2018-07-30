//
//  BiuRoom.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/15/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class BiuRoom: SuperModule {
    var id: String?
    var name: String?
    var owner: String?
    var roomImage: String?
    var roomDescription: String?
    var participants: [BiuUser] = []
    var messages: [BiuMessage] = []
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case roomImage
        case roomDescription
        case participants
        case messages
    }
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
