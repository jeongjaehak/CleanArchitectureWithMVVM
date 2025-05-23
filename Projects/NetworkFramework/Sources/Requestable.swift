//
//  Requestable.swift
//  NetworkFramework
//
//  Created by 정재학 on 3/28/25.
//

import Combine
import Foundation

/// 네트워크 매니저에 넣을 입력 값
public protocol Requestable {
    /// 결과 형태
    associatedtype Response: Decodable
    /// URL
    var urlString: String { get }
    /// 헤더
    var headers: Headers { get }
    /// 컨텐츠 타입
    var contentType: ContentType { get }
    /// 통신 방식
    var method: HttpMethod { get }
    /// 요청 파라메터
    var parameters: Parameters? { get }
}

// MARK: - 디폴트 타입 정의

extension Requestable {
    public var contentType: ContentType { .json }
    public var method: HttpMethod { .get }
    public var headers: Headers {
        ["Content-Type": contentType.rawValue]
    }
}

// MARK: - 데이터 요청

extension Requestable {
    /// 요청 데이터 기반으로 데이터 통신하는 함수
    /// - Returns: 응답 객체 또는 네트워크 오류 발생
    public func request() -> AnyPublisher<Response, NetworkError> {
        Future<Response, NetworkError> { promise in
            Task {
                // URL 생성
                let url: URL
                var body: Data?
                switch method {
                    // URL + ? + 쿼리 형식
                case .get, .delete:
                    var components = URLComponents(string: urlString)
                    components?.queryItems = parameters?.map { URLQueryItem(name: $0, value: "\($1)") }
                    guard let componentsURL = components?.url else {
                        promise(.failure(.invalidURL))
                        return
                    }
                    url = componentsURL
                    
                    // 바디에 key:value 형식
                case .put, .post:
                    guard let makeURL = URL(string: urlString) else {
                        promise(.failure(.invalidURL))
                        return
                    }
                    url = makeURL
                    if contentType == .json {
                        guard let parameters else { break }
                        body = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                    }
                }
                
                // 요청 객체 생성
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = method.rawValue
                urlRequest.allHTTPHeaderFields = headers
                urlRequest.httpBody = body
                
                let configuration = URLSessionConfiguration.default
                let urlSession = URLSession(configuration: configuration)
                do {
                    print( "REQUEST DATA" )
                    print( "URL : \(urlString)" )
                    print( "PARAMS : \(parameters ?? [:])" )
                    print( "--------------------------" )
                    // 데이터 통신
                    let (data, response) = try await urlSession.data(for: urlRequest)
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                    guard 200 <= statusCode && statusCode < 300 else { throw NetworkError.serverError(statusCode: statusCode) }
                    let decoder = JSONDecoder()
                    let parsedResponse = try decoder.decode(Response.self, from: data)
                    print( "RESPONSE DATA" )
                    print( "URL : \(urlString)" )
                    print( "DATA : \(parsedResponse)" )
                    print( "--------------------------" )
                    // 파싱 완료된 데이터 전달
                    promise(.success(parsedResponse))

                // MARK: - 통신 오류 처리
                    
                } catch let error as URLError {
                    promise(.failure(.error(errorMessage: error.localizedDescription)))
                } catch let error as DecodingError {
                    promise(.failure(.invalidJSON(errorMessage: error.localizedDescription)))
                } catch let error as NetworkError {
                    promise(.failure(error))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
