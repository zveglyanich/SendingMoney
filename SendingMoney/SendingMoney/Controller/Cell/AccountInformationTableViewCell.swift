//
//  AccountTableViewCell.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 08.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit

class AccountInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var accountInformationItemLabel: UILabel!
    @IBOutlet weak var accountInformationValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
