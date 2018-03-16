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
    private var module = "TODO"
    
    init(for vc: SuperViewController) {
        self.output = vc
        self.navigator = LobbyNavigator(vc: vc)
    }
}

extension LobbyHelper: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomListTableViewCell.cellIdentifier, for: indexPath) as! RoomListTableViewCell
        return cell
    }
    
    
}
