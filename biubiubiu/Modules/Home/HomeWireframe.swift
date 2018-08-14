//
//  HomeWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 8/14/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class HomeWireframe: BaseWireframe {
    private let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let moduleViewController = navigationController.topViewController as! HomeViewController
        super.init(viewController: moduleViewController)
        
        let eventHandler = HomeEventHandler(viewController: moduleViewController, interactor: HomeInteractor(), wireframe: self)
        moduleViewController.eventHandler = eventHandler
    }
}
