//
//  TableViewController.swift
//  SelfSizing
//
//  Created by Tibor Bodecs on 04/08/16.
//  Copyright © 2016 Tibor Bodecs. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {

    var dataSource: [String] = [
        "Donec id elit non mi porta gravida at eget metus.",
        "Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
        "Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vestibulum id ligula porta felis euismod semper. Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo.",
        "Maecenas faucibus mollis interdum.",
        "Donec ullamcorper nulla non metus auctor fringilla. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum.",
        "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum.",
    ]
}

extension TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tableView = self.tableView else {
            return
        }
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        NotificationCenter.default.addObserver(tableView,
                                               selector: #selector(UITableView.reloadData),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
    }
}

extension TableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.dynamicLabel?.text = self.dataSource[indexPath.row]
        cell.dynamicLabel.font  = UIFont.preferredFont(forTextStyle: .body)
        
        return cell
    }
}
