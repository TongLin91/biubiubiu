//
//  BaseWireframe.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/30/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class BaseWireframe {
    
    fileprivate unowned var _viewController: UIViewController
    
    init(viewController: UIViewController) {
        _viewController = viewController
    }
    
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}
