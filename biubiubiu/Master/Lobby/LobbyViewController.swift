//
//  LobbyViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/13/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class LobbyViewController: SuperViewController {
    
    var helper: LobbyHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper = LobbyHelper(for: self)
        
        self.view.backgroundColor = .yellow
        self.navigationItem.title = "Lobby"
    }
    
    
    
}
