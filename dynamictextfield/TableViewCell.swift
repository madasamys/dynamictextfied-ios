//
//  TableViewCell.swift
//  dynamictextfield
//
//  Created by Madasamy Sankarapandian on 29/09/2016.
//  Copyright © 2016 mCruncher. All rights reserved.
//

import UIKit

@objc protocol ActionDelegate {
    func onTapAdd(_ sender: AnyObject, indexPath: IndexPath)
    func onTapRemove(_ sender: AnyObject, indexPath: IndexPath)
    func onTextChange(_ text: String, indexPath: IndexPath)
}

class TableViewCell: UITableViewCell {
    
    var medicationActionDelegate: ActionDelegate!
    var indexPath = IndexPath()
    
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textFieldValue: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // self.removeButton.isHidden = fa
        // Initialization code
    }
    
    @IBAction func onTapAddButton(_ sender: AnyObject) {
        self.medicationActionDelegate.onTapAdd(sender, indexPath: indexPath)
    }
    
    @IBAction func tapOnRemove(_ sender: AnyObject) {
        self.medicationActionDelegate.onTapRemove(sender, indexPath: indexPath)
    }
    
    @IBAction func onTextFiledEditing(_ sender: AnyObject) {
        self.medicationActionDelegate.onTextChange(textFieldValue.text!, indexPath: indexPath)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
