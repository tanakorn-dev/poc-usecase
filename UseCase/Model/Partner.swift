//
//  Partner.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 18/5/2564 BE.
//

import SwiftyJSON

public struct Partner {
    public let name: String
    public let image: String
}

extension Partner {
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
    }
}
