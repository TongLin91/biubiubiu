//
//  LobbyNavigator.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/15/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class LobbyNavigator: NSObject {
    var output: SuperViewController!
    
    init(vc: SuperViewController) {
        super.init()
        self.output = vc
    }
}
