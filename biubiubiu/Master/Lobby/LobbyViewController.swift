//
//  LobbyViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/13/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class LobbyViewController: SuperViewController {
    
    @IBOutlet weak var roomsTableView: UITableView!
    var helper: LobbyHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helper = LobbyHelper(for: self)
        
        self.appearanceSetup()
        self.tableViewSetup()
    }
    
    @IBAction func createNewRoomTapped(_ sender: UIBarButtonItem) {
        helper.gotoNewRoomCreation()
    }
    
    private func appearanceSetup() {
        self.view.backgroundColor = .yellow
        self.navigationItem.title = "Lobby"
    }

    private func tableViewSetup() {
        roomsTableView.register(UINib(nibName: "RoomListTableViewCell", bundle: nil), forCellReuseIdentifier: RoomListTableViewCell.cellIdentifier)
        roomsTableView.delegate = helper
        roomsTableView.dataSource = helper
    }
}
