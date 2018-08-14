//
//  ProfileEventHandler.swift
//  biubiubiu
//
//  Created by Tong Lin on 8/1/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class ProfileEventHandler {
    
    private unowned var viewController: ProfileViewController
    private var interactor: ProfileInteractor
    private var wireframe: ProfileWireframe
    
    init(viewController: ProfileViewController, interactor: ProfileInteractor, wireframe: ProfileWireframe) {
        self.viewController = viewController
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
