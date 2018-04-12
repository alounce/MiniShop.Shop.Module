//
//  SaleOrderViewer.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/23/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import UIKit

class SaleOrderViewer: UITableViewController {

    var viewModel: OrderViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount(forSection: section)
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            if row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SaleOrderHeaderCell",
                                                               for: indexPath) as? SaleOrderViewerHeaderCell else {
                    fatalError("Cannot obtain SaleOrderHeaderCell")
                }
                cell.configure(number: viewModel.number,
                               quantity: viewModel.totalQty,
                               date: viewModel.date,
                               total: viewModel.totalSumString)
                return cell
            }
        }

        if section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SaleOrderDetailCell",
                                                           for: indexPath) as? SaleOrderViewerDetailCell else {
                fatalError("Cannot obtain SaleOrderHeaderCell")
            }
            cell.detailTextLabel?.text = viewModel.detailName(forIndex: row)
            let totalString = viewModel.detailSumString(forIndex: row)
            let value = viewModel.detailValue(forIndex: row)
            let title = viewModel.detailName(forIndex: row)
            let info = viewModel.detailInfo(forIndex: row)
            cell.configure(title: title, details: info, value: value, total: totalString)
            return cell
        }

        fatalError("Unable to find proper cell")
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "General:"
        }
        if section == 1 {
            return "Sold Items:"
        }
        return nil
    }

    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }
        return 60
    }
}
