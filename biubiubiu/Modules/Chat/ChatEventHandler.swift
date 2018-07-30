//
//  ChatEventHandler.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/30/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation

final class ChatEventHandler {
    
    private unowned var viewController: ChatViewController
    private var interactor: ChatInteractor
    private var wireframe: ChatWireframe
    
    init(viewController: ChatViewController, interactor: ChatInteractor, wireframe: ChatWireframe) {
        self.viewController = viewController
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
