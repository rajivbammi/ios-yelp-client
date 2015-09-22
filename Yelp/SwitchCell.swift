//
//  SwitchCell.swift
//  Yelp
//
//  Created by Rajiv Bammi on 9/21/15.
//  Copyright (c) 2015  Rajiv B. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate : SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setting up event for value changed.
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged() {
        println("Switch Value is changed ")
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
    }
    
}
