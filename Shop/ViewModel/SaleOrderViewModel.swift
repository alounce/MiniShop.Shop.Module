//
//  SaleOrderViewModel.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/23/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation
import MiniShop_Shared

public typealias OrderType = Int

public class SaleOrderViewModel {

    // MARK: - data
    var order: SaleOrder
    
    public init(order: SaleOrder) {
        self.order = order
    }
}

extension SaleOrderViewModel: OrderViewModel {

    public static let saleOrderType: OrderType = 1
    
    // MARK: - properties
    public var type: OrderType { return SaleOrderViewModel.saleOrderType }
    public var typeText: String { return "Sale" }
    // MARK: summary
    public var number: String {
        return "# \(order.id)"
    }
    
    public var summary: String {
        return String(format: "\(order.details.count) positions with \(order.totalQty)pcs in total")
    }

    public var totalQty: String {
        return Formatter.stringFromQty(order.totalQty) + " in total"
    }

    public var date: String {
        return Formatter.stringFromDateString(order.date)
    }

    public var totalSumString: String {
        return Formatter.stringFromMoney(order.totalSum)
    }

    // MARK: details
    public func detailName(forIndex index: Int) -> String {
        return order.details[index].productName
    }

    public func detailInfo(forIndex index: Int) -> String {
        return order.details[index].productInfo
    }

    public func detailValue(forIndex index: Int) -> String {
        let qty = detailQtyString(forIndex: index)
        let price = detailPriceString(forIndex: index)
        return "\(qty) * \(price)"
    }

    public func detailPriceString(forIndex index: Int) -> String {
        let money = order.details[index].price
        return Formatter.stringFromMoney(money)
    }

    public func detailSumString(forIndex index: Int) -> String {
        let money = order.details[index].sum
        return Formatter.stringFromMoney(money)
    }

    public func detailQtyString(forIndex index: Int) -> String {
        let qty = order.details[index].qty
        return Formatter.stringFromQty(qty)
    }
}

extension SaleOrderViewModel: OrderListDataSource {
    
    public func sectionCount() -> Int {
        return 2
    }
    
    public func itemsCount(forSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return order.details.count
        default: return 0
        }
    }
}
