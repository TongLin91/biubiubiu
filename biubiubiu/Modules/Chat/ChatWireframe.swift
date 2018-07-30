//
//  ChatWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/30/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class ChatWireframe: BaseWireframe {
    
    private let storyboard = UIStoryboard(name: "ChatStoryboard", bundle: nil)
    
    // MARK: - Module setup -
    
    init() {
        let moduleViewController = storyboard.instantiateViewController(withIdentifier: "ChatViewControllerIdentifier") as! ChatViewController
        super.init(viewController: moduleViewController)
        
        let interactor = ChatInteractor()
        let eventHandler = ChatEventHandler(viewController: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.eventHandler = eventHandler
    }
    
}
