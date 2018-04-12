//
//  SaleOrderCell.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/23/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import UIKit

class SaleOrderCell: UITableViewCell {
    @IBOutlet weak private var mainLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var totallabel: UILabel!
    @IBOutlet weak private var detailsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(details: String, date: String, total: String) {
        detailsLabel.text = details
        dateLabel.text = date
        totallabel.text = total
    }
}
