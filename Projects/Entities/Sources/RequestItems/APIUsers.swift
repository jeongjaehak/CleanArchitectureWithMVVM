//
//  APIUsers.swift
//  Entities
//
//  Created by 정재학 on 3/28/25.
//

import Foundation
@_exported import NetworkFramework

/// 유저 정보를 얻어오는 API
public final class APIUsers: RequestItem {
    /// 응답
    public typealias Response = [UserInformation]
    
    /// 요청할 URL
    public var urlString: String {
        server.host + "/users"
    }
    
    /// 요청 데이터
    public var parameters: Parameters?
    
    public init() {}
}
