//
//  TableViewController.swift
//  Evidencia2
//
//  Created by user189807 on 10/28/21.
//  Copyright © 2021 user189807. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

@IBOutlet var myTable :UITableView!

override func viewDidLoad() {
    super.viewDidLoad()
    
    myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    myTable.delegate = self
    myTable.dataSource = self
    // Do any additional setup after loading the view.
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier:"cell" ,for:indexPath )
    cell.textLabel?.text = "Julio. Ruiz"
    cell.accessoryType = .disclosureIndicator
    return cell
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let chat = ChatViewController()
    chat.title = "Chat away"
    navigationController?.pushViewController(chat, animated: true)
    
    }
    
    
}
