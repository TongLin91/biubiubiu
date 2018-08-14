//
//  BaseWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/30/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

enum Transition {
    case root
    case push
    case present(fromViewController: BaseViewController)
}

class BaseWireframe {
    
    fileprivate unowned var _viewController: BaseViewController
    
    init(viewController: BaseViewController) {
        _viewController = viewController
    }
    
}

extension BaseWireframe {
    
    var viewController: BaseViewController {
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
    func show(_ viewController: BaseViewController, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        case .present(let fromViewController):
            navigationController?.viewControllers = [viewController]
            fromViewController.present(navigationController!, animated: animated, completion: nil)
        case .root:
            navigationController?.setViewControllers([viewController], animated: animated)
        }
    }
    
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
}
