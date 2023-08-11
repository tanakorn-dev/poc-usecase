//
//  Ads.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 18/5/2564 BE.
//

import SwiftyJSON

public struct Ads {
    public let image: String
    public let link: String
}

extension Ads {
    init(json: JSON) {
        self.image = json["image"].stringValue
        self.link = json["link"].stringValue
    }
}
