//
//  LobbyNavigator.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/15/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit

class LobbyNavigator {
    var output: SuperViewController!
    
    init(vc: SuperViewController) {
        self.output = vc
    }
    
    func pushNewRoomCreationVC() {
        let createNewRoomVC = UITableViewController(nibName: "NewRoomTableViewController", bundle: nil)
        output.navigationController?.pushViewController(createNewRoomVC, animated: true)
    }
}
