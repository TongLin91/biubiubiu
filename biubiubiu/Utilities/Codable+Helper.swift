//
//  Codable+Helper.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/9/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] } ?? [:]
    }
}

extension Decodable {
    static func parsingUser(_ value: Any) -> BiuUser? {
        guard let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted),
              let user = try? JSONDecoder().decode(BiuUser.self, from: data) else { return nil }
        
        return user
    }
    
    static func parsingRoom(_ value: Any) -> BiuRoom? {
        guard let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted),
            let room = try? JSONDecoder().decode(BiuRoom.self, from: data) else { return nil }
        
        return room
    }
    
    
}

class SuperModule: NSObject, Codable {

}
