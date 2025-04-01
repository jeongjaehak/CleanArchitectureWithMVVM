//
//  GetUserInformations.swift
//  UseCases
//
//  Created by 정재학 on 4/1/25.
//

import Combine
import Entities
import Foundation

/// 유저정보를 가져온다.
public final class GetUserInformations {
    public init() {}
    public func execute()-> AnyPublisher<APIUsers.Response, NetworkError> {
        return APIUsers().request().eraseToAnyPublisher()
    }
}
