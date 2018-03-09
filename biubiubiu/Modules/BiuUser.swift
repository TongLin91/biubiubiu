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
//    var friendList: [String] = []
    
    private enum CodingKeys: String, CodingKey {
        case displayName
        case dateJoined
        case invitedBy
        case avatar
    }
    
    init(name: String, invitedBy: String) {
        super.init()
        self.displayName = name
        self.dateJoined = Date()
        self.invitedBy = invitedBy
        self.avatar = ""
    }
}

extension Encodable {
    var dictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] } ?? [:]
    }
}

extension Decodable {
    static func parsingValue(_ value: Any) -> BiuUser? {
        if let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted),
            let user = try? JSONDecoder().decode(BiuUser.self, from: data) {
            return user
        }
        
        return nil
    }
}
