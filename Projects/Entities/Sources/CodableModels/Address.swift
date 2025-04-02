//
//  Address.swift
//  Entities
//
//  Created by 정재학 on 3/27/25.
//

import Foundation

/// 주소값 정보를 담는 구조체
public struct Address: Decodable {
    /// 도로명
    public let street: String
    /// 동호수
    public let suite: String
    /// 도시명
    public let city: String
    /// 우편번호
    public let zipcode: String
    /// GPS 좌표값
    public let geo: Geo
    
    // MARK: - Init
    
    public init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

extension Address: Hashable, Equatable {
    public static func == (lhs: Address, rhs: Address) -> Bool {
        lhs.zipcode == rhs.zipcode
    }
}
