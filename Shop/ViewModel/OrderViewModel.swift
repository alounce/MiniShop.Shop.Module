//
//  OrderViewModel.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/24/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation

public protocol OrderViewModel: OrderListDataSource {
    // MARK: - summary properties
    var number: String { get }
    var type: OrderType { get }
    var typeText: String { get }
    var totalQty: String { get }
    var date: String { get }
    var totalSumString: String { get }
    var summary: String { get }
    // MARK: - detail properties
    func detailName(forIndex index: Int) -> String
    func detailInfo(forIndex index: Int) -> String
    func detailValue(forIndex index: Int) -> String
    func detailPriceString(forIndex index: Int) -> String
    func detailSumString(forIndex index: Int) -> String
    func detailQtyString(forIndex index: Int) -> String
}
