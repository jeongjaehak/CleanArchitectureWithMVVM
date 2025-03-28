//
//  NetworkError.swift
//  NetworkFramework
//
//  Created by 정재학 on 3/28/25.
//

import Foundation

public enum NetworkError: Error {
    /// URL 에러
    case invalidURL
    /// 데이터 없음
    case dataNull
    /// JSON 에러
    case invalidJSON( errorMessage: String )
    /// 네트워크 미연결
    case networkDisconnected
    /// 오류 + 내용
    case error( errorMessage: String )
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            "URL이 유효하지 않습니다."
        case .dataNull:
            "응답 데이터가 없습니다."
        case .invalidJSON(errorMessage: let message):
            "JSON 포맷이 유효하지 않습니다.\n" + message
        case .networkDisconnected:
            "네트워크 연결이 끊어졌습니다."
        case .error(errorMessage: let message):
            message
        }
    }
}
