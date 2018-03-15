//
//  BiuMessage.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/15/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class BiuMessage: NSObject, Codable {
    var sender: String?
    var content: String?
    var timeStamp: Date?
    
    private enum CodingKeys: String, CodingKey {
        case sender
        case content
        case timeStamp
    }
    
    override init() {
        super.init()
    }
}
