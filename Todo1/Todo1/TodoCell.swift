//
//  File.swift
//  Todo1
//
//  Created by Seungseop Lee on 3/18/24.
//

import UIKit

class TodoCell: UITableViewCell {
    
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var todoName: UILabel!
    
    var switchChanged:((Bool)->Void)?
    
    
    @IBAction func switchButtonTapped(_ sender: UISwitch) {
        switchChanged?(sender.isOn)
    }
            
}

