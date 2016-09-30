//
//  CustomTableViewController.swift
//  dynamictextfield
//
//  Created by Madasamy Sankarapandian on 29/09/2016.
//  Copyright © 2016 mCruncher. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController, ActionDelegate {
    
    var fooArrays = Array<Foo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let foo = Foo()
        foo.addHidden = false
        foo.removeHidden = true
        foo.text = ""
        fooArrays.append(foo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fooArrays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let foo = fooArrays[indexPath.row]
        cell.medicationActionDelegate = self
        cell.addButton.isHidden = foo.addHidden
        cell.removeButton.isHidden = foo.removeHidden
        cell.textFieldValue.text = foo.text
        cell.indexPath = indexPath
        return cell
    }
    
    func onTapAdd(_ sender: AnyObject, indexPath: IndexPath) {
        let existingFoo = fooArrays[indexPath.row]
        existingFoo.addHidden = true
        existingFoo.removeHidden = false
        let foo = Foo()
        foo.addHidden = false
        foo.removeHidden = true
        fooArrays.append(foo)
        self.tableView.reloadData()
    }
    
    func onTextChange(_ text: String, indexPath: IndexPath) {
        let existingFoo = fooArrays[indexPath.row]
        existingFoo.text = text
    }
    
    func onTapRemove(_ sender: AnyObject, indexPath: IndexPath) {
        fooArrays.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
}

class Foo {
    var addHidden: Bool!
    var removeHidden: Bool!
    var text: String!
}
