//
//  LobbyHelper.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/15/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class LobbyHelper: NSObject {
    private var navigator: LobbyNavigator!
    private var output: SuperViewController!
    
    init(for vc: SuperViewController) {
        self.output = vc
        self.navigator = LobbyNavigator(vc: vc)
    }
}
