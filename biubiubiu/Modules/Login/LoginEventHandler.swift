//
//  LoginEventHandler.swift
//  biubiubiu
//
//  Created by Tong Lin on 8/14/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class LoginEventHandler {
    
    private unowned var viewController: LoginViewController
    private var interactor: LoginInteractor
    private var wireframe: LoginWireframe
    
    init(viewController: LoginViewController, interactor: LoginInteractor, wireframe: LoginWireframe) {
        self.viewController = viewController
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
