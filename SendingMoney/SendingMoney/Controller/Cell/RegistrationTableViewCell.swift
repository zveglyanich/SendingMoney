//
//  RegistrationTableViewCell.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 05.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {

    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var registrationTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
