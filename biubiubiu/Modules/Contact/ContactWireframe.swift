//
//  ContactWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/31/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class ContactWireframe: BaseWireframe {
    
    private let storyboard = UIStoryboard(name: "ContactViewController", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let moduleViewController = navigationController.topViewController as! ContactViewController
        super.init(viewController: moduleViewController)
        let eventHandler = ContactEventHandler(viewController: moduleViewController, interactor: ContactInteractor(), wireframe: self)
        moduleViewController.eventHandler = eventHandler
    }
    
}
