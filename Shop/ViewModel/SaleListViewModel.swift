//
//  SaleListViewModel.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/23/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation
import MiniShop_Shared

public class SaleListViewModel {
    // working with the data
    var orders = [SaleOrder]()
    var provider: ShopDataProvider

    public init(provider: ShopDataProvider) {
        self.provider = provider
    }

    public func downloadSales(completion: @escaping (Error?) -> Void) {
        provider.downloadSales { [weak self] err, orders in
            if let orders = orders {
                self?.orders = orders
            }
            completion(err)
        }
    }

    // custom properties
    public var totalSum: Int {
        return orders
            .map { $0.totalSum }
            .reduce(0, +)
    }

    public var totalSumString: String {
        return Formatter.stringFromMoney(totalSum)
    }

    public var summary: String {
        return "\(itemsCount) orders for \(totalSumString) in total"
    }

    // datasource
    public let groupsCount: Int = 1
    public var itemsCount: Int { return orders.count }
    
    public func getItem(byIndex index: Int) -> OrderViewModel {
        let order = orders[index]
        return SaleOrderViewModel(order: order)
    }
}
