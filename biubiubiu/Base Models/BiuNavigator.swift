//
//  BiuNavigator.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/8/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit

protocol BiuNavigator {
    var container: GroundControlViewController? { get }
    
    func push<V:SuperViewController>(_ viewController:V)
    func pop<V:SuperViewController>(_ viewController:V)
    func present<V:SuperViewController>(_ viewController:V)
}

extension BiuNavigator {
    func push<V:SuperViewController>(_ vc:V) {
        container?.addChildViewController(vc)
        container?.view.insertSubview(vc.view, belowSubview: container!.biuTabBar)
        vc.view.frame = container!.view.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.didMove(toParentViewController: container)
    }
    
    func pop<V:SuperViewController>(_ vc:V) {
        vc.willMove(toParentViewController: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
    func present<V:SuperViewController>(_ vc:V) {
        
    }
}
