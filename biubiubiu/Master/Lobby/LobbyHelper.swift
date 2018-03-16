//
//  LobbyHelper.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/15/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit

class LobbyHelper: NSObject {
    private var navigator: LobbyNavigator!
    private var output: SuperViewController!
    private var module: LobbyModule!
    
    init(for vc: SuperViewController) {
        self.module = LobbyModule()
        self.output = vc
        self.navigator = LobbyNavigator(vc: vc)
    }
}

extension LobbyHelper: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.module.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomListTableViewCell.cellIdentifier, for: indexPath) as! RoomListTableViewCell
        
        let room = module.rooms[indexPath.row]
        print(room.id ?? "never gonna happen")
        cell.backgroundColor = .lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    
}
