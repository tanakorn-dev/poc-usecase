//
//  ForYou.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 18/5/2564 BE.
//

import SwiftyJSON

public struct ForYou {
    public let title: String
    public let image: String
    public let category: String
    public let price: Int
    public let ratting: String
}

extension ForYou {
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.image = json["image"].stringValue
        self.category = json["category"].stringValue
        self.price = json["price"].intValue
        self.ratting = json["ratting"].stringValue
    }
}
