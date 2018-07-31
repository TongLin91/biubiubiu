//
//  ChatEventHandler.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/30/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

final class ChatEventHandler {
    
    private unowned var viewController: ChatViewController
    private var interactor: ChatInteractor
    private var wireframe: ChatWireframe
    
    init(viewController: ChatViewController, interactor: ChatInteractor, wireframe: ChatWireframe) {
        self.viewController = viewController
        self.interactor = interactor
        self.wireframe = wireframe
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatEventHandler.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatEventHandler.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            self.viewController.view.frame.origin.y == 0 else { return }
        
//        self.viewController.view.bounds.size.height -= keyboardSize.height
        self.viewController.view.frame.origin.y -= keyboardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            self.viewController.view.frame.origin.y != 0 else { return }
        
//        self.viewController.view.bounds.size.height += keyboardSize.height
        self.viewController.view.frame.origin.y += keyboardSize.height
    }
}
