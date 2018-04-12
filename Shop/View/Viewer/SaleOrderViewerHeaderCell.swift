//
//  SaleOrderViewerHeaderCell.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/24/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import UIKit

class SaleOrderViewerHeaderCell: UITableViewCell {

    @IBOutlet weak private var numberLabel: UILabel!
    @IBOutlet weak private var qtyLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var totalLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(number: String, quantity: String,
                   date: String, total: String) {
        numberLabel.text = number
        qtyLabel.text = quantity
        dateLabel.text = date
        totalLabel.text = total
    }

}
