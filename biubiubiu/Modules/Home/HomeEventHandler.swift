//
//  HomeEventHandler.swift
//  biubiubiu
//
//  Created by Tong Lin on 8/14/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

final class HomeEventHandler {
    
    private unowned var viewController: HomeViewController
    private var interactor: HomeInteractor
    private var wireframe: HomeWireframe
    
    init(viewController: HomeViewController, interactor: HomeInteractor, wireframe: HomeWireframe) {
        self.viewController = viewController
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
