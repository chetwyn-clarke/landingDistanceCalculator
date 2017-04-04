//
//  AircraftListCell.swift
//  Landing Distance Calculator
//
//  Created by Chetwyn on 4/3/17.
//  Copyright © 2017 Clarke Enterprises. All rights reserved.
//

import UIKit

class AircraftListCell: UITableViewCell {
    
    @IBOutlet weak var aircraftLbl: UILabel!
    @IBOutlet weak var engineLbl: UILabel!
    
    func configureCell(aircraft: Aircraft) {
        aircraftLbl.text = aircraft.type
        engineLbl.text = aircraft.engine
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
