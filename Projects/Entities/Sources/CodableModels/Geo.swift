//
//  Geo.swift
//  Entities
//
//  Created by 정재학 on 3/27/25.
//

import Foundation

public struct Geo: Decodable {
    /// 위도
    public let latitude: String
    /// 경도
    public let longitude: String
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
    // MARK: - Init
    
    public init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Geo: Hashable, Equatable {}
