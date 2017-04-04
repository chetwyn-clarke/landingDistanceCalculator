//
//  ConfigurationListCell.swift
//  Landing Distance Calculator
//
//  Created by Chetwyn on 4/3/17.
//  Copyright © 2017 Clarke Enterprises. All rights reserved.
//

import UIKit

class ConfigurationListCell: UITableViewCell {

    @IBOutlet weak var configurationNameLbl: UILabel!
    @IBOutlet weak var flapSettingLbl: UILabel!
    
    func configureCell(configuration: Configuration) {
        configurationNameLbl.text = configuration.name
        flapSettingLbl.text = configuration.flapSetting
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
