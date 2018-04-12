//
//  SaleOrderViewerDetailCell.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/24/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import UIKit

class SaleOrderViewerDetailCell: UITableViewCell {

    @IBOutlet weak private var productLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var valueLabel: UILabel!
    @IBOutlet weak private var totalLabel: UILabel!
    @IBOutlet weak private var typeView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String, details: String,
                   value: String, total: String,
                   color: UIColor = .green) {
        productLabel.text = title
        descriptionLabel.text = details
        valueLabel.text = value
        totalLabel.text = total
        typeView.backgroundColor = color
    }
}
