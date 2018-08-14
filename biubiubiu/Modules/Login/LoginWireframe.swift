//
//  LoginWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 8/14/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class LoginWireframe: BaseWireframe {
    
    private let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let moduleViewController = storyboard.instantiateInitialViewController() as! LoginViewController
        super.init(viewController: moduleViewController)
        
        let interactor = LoginInteractor()
        let eventHandler = LoginEventHandler(viewController: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.eventHandler = eventHandler
    }
    
}
