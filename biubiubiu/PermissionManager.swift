//
//  PermissionManager.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/13/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import UIKit

enum AccessState {
    case Allow, Block
}

class PermissionManager {
    static let shared = PermissionManager()
    private var delegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    init() {}
    
    func blockAccess() {
        self.switchPermissionTo(.Block)
    }
    
    func allowAccess() {
        self.switchPermissionTo(.Allow)
    }
    
    private func switchPermissionTo(_ state: AccessState) {
        
        _ = delegate.window?.subviews.map{ view in
            if view is WelcomeView {
                view.removeFromSuperview()
            }
        }
        
        if state == .Block {
            delegate.window?.addSubview(blockingView)
        }
    }
    
    lazy var blockingView: WelcomeView = {
        let view = WelcomeView()
        view.backgroundColor = .blue
        view.frame = delegate.window!.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
}


class WelcomeView: UIView {
    
}
