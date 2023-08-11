//
//  Discover.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 18/5/2564 BE.
//

import Foundation
import SwiftyJSON

public enum DiscoverType: String, Codable {
    case categoty
    case forYou = "for_you"
    case ads
    case parner
}

public struct Discover: Decodable {
    private let typeStr: String
    private let data: [JSON]
    public let title: String
}

extension Discover {
    
    init(json: JSON) {
        self.typeStr = json["type"].stringValue
        self.title = json["title"].stringValue
        self.data = json["data"].arrayValue
    }
    
    public var type: DiscoverType {
        if self.typeStr == "categoty" {
            return .categoty
        } else if self.typeStr == "for_you" {
            return .forYou
        } else if self.typeStr == "ads" {
            return .ads
        } else {
            return .parner
        }
    }

    public var categorise: [Classification] {
        if self.type == .categoty {
            var categorise: [Classification] = []
            self.data.forEach() { value in
                categorise.append(Classification(json: value))
            }
            return categorise
        } else {
            return []
        }
    }

    public var forYou: [ForYou] {
        if self.type == .forYou {
            var forYou: [ForYou] = []
            self.data.forEach() { value in
                forYou.append(ForYou(json: value))
            }
            return forYou
        } else {
            return []
        }
    }

    public var ads: [Ads] {
        if self.type == .ads {
            var ads: [Ads] = []
            self.data.forEach() { value in
                ads.append(Ads(json: value))
            }
            return ads
        } else {
            return []
        }
    }

    public var partner: [Partner] {
        if self.type == .parner {
            var partner: [Partner] = []
            self.data.forEach() { value in
                partner.append(Partner(json: value))
            }
            return partner
        } else {
            return []
        }
    }
}
