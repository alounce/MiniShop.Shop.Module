//
//  ShopDataProvider.swift
//  Shop
//
//  Created by Alexander Karpenko on 4/4/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation

public protocol ShopDataProvider {
    func downloadSales(completion: @escaping (Error?, [SaleOrder]?) -> Void)
}
