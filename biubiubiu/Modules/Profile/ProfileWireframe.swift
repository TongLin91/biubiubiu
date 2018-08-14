//
//  ProfileWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 8/1/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

import UIKit

final class ProfileWireframe: BaseWireframe {
    
    private let storyboard = UIStoryboard(name: "ProfileViewController", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let moduleViewController = navigationController.topViewController as! ProfileViewController
        super.init(viewController: moduleViewController)
        
        let eventHandler = ProfileEventHandler(viewController: moduleViewController, interactor: ProfileInteractor(), wireframe: self)
        moduleViewController.eventHandler = eventHandler
    }
    
}
