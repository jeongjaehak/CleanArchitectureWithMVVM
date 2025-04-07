//
//  Server.swift
//  Entities
//
//  Created by 정재학 on 3/28/25.
//

import Foundation

public let server = Server()

/// 서버 상태
public enum Server {
    /// 개발 서버
    case develop
    /// 스테이징 서버
//    case staging
    /// 운영 서버
    case production
    
    // MARK: - init
    
    public init() {
#if DEBUG
        self = .develop
#else
        self = .production
#endif
    }
}

extension Server {
    var host: String {
        switch self {
        case .develop:
            "https://jsonplaceholder.typicode.com"
//        case .staging:
//            "https://jsonplaceholder.typicode.com"
        case .production:
            "https://jsonplaceholder.typicode.com"
        }
    }
}
