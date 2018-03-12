//
//  GroundControlHelper.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

class GroundControlHelper: NSObject, BiuNavigator {
    var container: GroundControlViewController?
    var currentUser: BiuUser?
    
    init(_ vc: GroundControlViewController) {
        container = vc
    }
}
