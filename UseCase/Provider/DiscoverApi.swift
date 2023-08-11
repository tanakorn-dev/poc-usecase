//
//  DiscoverApi.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 17/5/2564 BE.
//

import Foundation
import Moya

public enum DiscoverApi {
    case getDiscoverShelf
}

extension DiscoverApi: TargetType {
    public var baseURL: URL {
        return URL(string: "https://poc-app.onrender.com")!
    }
    
    public var path: String {
        switch self {
        case .getDiscoverShelf:
            return "/api/poc/discover/shelf"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getDiscoverShelf:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getDiscoverShelf:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
