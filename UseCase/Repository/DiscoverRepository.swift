//
//  DiscoverRepository.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 18/5/2564 BE.
//

import Foundation
import Moya
import SwiftyJSON

public protocol DiscoverRepository {
    func getDiscoverShelf(_ completion: @escaping (Bool, [Discover]) -> ())
}

final public class DiscoverRepositoryImpl: DiscoverRepository {
    
    private let discoverProvider = MoyaProvider<DiscoverApi>()
    
    public init() {
        // MARK: - Init
    }
    
    public func getDiscoverShelf(_ completion: @escaping (Bool, [Discover]) -> ()) {
        discoverProvider.request(.getDiscoverShelf) { result in

            switch result {
            case .success(let response):
                do {
                    let rawJson = try response.mapJSON()
                    let json = JSON(rawJson)
                    let shelfList = json["shelf"].arrayValue

                    var discover: [Discover] = []
                    shelfList.forEach() { shelf in
                        discover.append(Discover(json: shelf))
                    }

                    completion(true, discover)
                } catch {
                    completion(false, [])
                }
            case .failure:
                completion(false, [])
            }
        }
    }
}
