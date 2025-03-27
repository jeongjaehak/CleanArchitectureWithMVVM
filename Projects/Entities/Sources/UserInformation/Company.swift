//
//  Company.swift
//  Entities
//
//  Created by 정재학 on 3/27/25.
//

import Foundation

/// 회사정보를 담는 구조체
public struct Company: Decodable {
    /// 회사명
    public let name: String
    /// 선전문구
    public let catchPhrase: String
    /// 사업목표
    public let businesStrategy: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case businesStrategy = "bs"
    }
}
