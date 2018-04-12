//
//  Order.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/22/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation
import Shared

public class Detail {
    var model: DetailModel
    
    public init(model: DetailModel) {
        self.model = model
    }

    public var product: Product {
        return Product.productById[model.productId]!
    }
    public var productName: String { return product.title }
    public var productInfo: String { return product.details }
    public var qty: Int { return model.qty }
    public var price: Int { return product.price }
    public var sum: Int { return qty * price }
}

public class Order {
    private static var counter: Int = 0
    
    private static func getId() -> Int {
        counter -= 1
        return counter
    }
    
    var model: OrderModel
    
    public init(model: OrderModel) {
        self.model = model
        self.details = model.details.map { Detail(model: $0) }
    }

    public var id: Int { return model.id }
    public var date: String { return model.date }
    public var details: [Detail]

    public var totalQty: Int {
        return details
            .map { $0.qty }
            .reduce(0, +)
    }

    public var totalSum: Int {
        return details.map { $0.sum }.reduce(0, +)
    }
}

public extension Order {
    convenience init(type: Int) {
        let newId = Order.getId()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let dateString = formatter.string(from: Date())
        let details = [DetailModel]()
        let model = OrderModel(id: newId, type: type, date: dateString, details: details)
        self.init(model: model)
    }
}
