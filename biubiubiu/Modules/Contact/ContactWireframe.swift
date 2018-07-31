//
//  ContactWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/31/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class ContactWireframe: BaseWireframe {
    
    private let storyboard = UIStoryboard(name: "ContactStoryboard", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let moduleViewController = storyboard.instantiateViewController(withIdentifier: "ContactViewControllerIdentifier") as! ContactViewController
        super.init(viewController: moduleViewController)
        
        let interactor = ContactInteractor()
        let eventHandler = ContactEventHandler(viewController: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.eventHandler = eventHandler
    }
    
}
