//
//  ListCell.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    static let identifier = "ListCell"
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryCodeView: UIView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
