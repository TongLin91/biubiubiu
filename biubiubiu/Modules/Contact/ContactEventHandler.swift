//
//  ContactEventHandler.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/31/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class ContactEventHandler {
    
    private unowned var viewController: ContactViewController
    private var interactor: ContactInteractor
    private var wireframe: ContactWireframe
    
    init(viewController: ContactViewController, interactor: ContactInteractor, wireframe: ContactWireframe) {
        self.viewController = viewController
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension ContactEventHandler {
    func gotoChat(_ user: BiuUser) {
        wireframe.show(ChatWireframe().viewController, with: .push, animated: true)
    }
}
