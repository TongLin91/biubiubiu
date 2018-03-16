//
//  LobbyModule.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/16/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class LobbyModule: NSObject {
    var rooms: [BiuRoom] = []
    
    override init() {}
    
    func fetchRoomList() {
        BiuNetworkManager.shared.fetchAllRooms { (response) in
            if let error = response.error {
                print(error.localizedDescription)
            } else if let data = response.data as? [String: Any] {
                self.rooms = []
                for (_, value) in data {
                    if let room = BiuRoom.parsingRoom(value) {
                        self.rooms.append(room)
                    }
                }
            }
        }
    }
}
