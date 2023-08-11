//
//  Classification.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import SwiftyJSON

public struct Classification {
    public var name: String
    public var image: String
}

extension Classification {
    public init(name: String) {
        self.name = name
        self.image = ""
    }
    
    public init(text: String) {
        self.name = text
        self.image = text
    }
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
    }
}
