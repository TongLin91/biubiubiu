//
//  ContactViewController.swift
//  biubiubiu
//
//  Created by Tong Lin on 7/31/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import UIKit

class ContactViewController: BaseViewController {
    
    var eventHandler: ContactEventHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do something
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}

extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCellIdentifier", for: indexPath)
        cell.backgroundColor = (indexPath.row%2 == 0) ? .red : .blue
        return cell
    }
}
