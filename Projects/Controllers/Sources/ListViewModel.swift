//
//  File.swift
//  Controllers
//
//  Created by 정재학 on 4/1/25.
//

import Combine
import Entities
import UseCases
import Foundation

/// 리스트 데이터를 관리하는 뷰모델
public final class ListViewModel {
    
    // MARK: - Input / Output
    
    /// From View
    public enum Input {
        /// 유저정보 요청
        case requestUsers
    }
    
    /// To View
    public enum Output {
        /// 화면 목록 갱신
        case updateList( users: [UserInformation] )
    }
    
    // MARK: - Properties
    
    /// View에 전달할 내용들
    private let output = PassthroughSubject<Output, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    
    public init() {}
}

// MARK: - Public Functions

extension ListViewModel {
    
    /// 이벤트 바인딩
    /// - Parameter input: UI 이벤트
    /// - Returns: UI 업데이트
    public func transform( input: AnyPublisher<Input, Never> ) -> AnyPublisher<Output,Never> {
        input.sink { [weak self] event in
            guard let self else { return }
            switch event {
            case .requestUsers:
                requestUsers()
            }
        }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
    
}

// MARK: - Private Functions

extension ListViewModel {
    /// 유저 정보를 가져온다.
    private func requestUsers() {
        GetUserInformations().execute().sink { [weak self] completion in
            guard let self else { return }
            switch completion {
            case .finished: // 성공
                break
            case .failure(_): // 실패 시 오류
                break
            }
        } receiveValue: { [weak self] userInformations in
            // 데이터 설정
            guard let self else { return }
            output.send(.updateList(users: userInformations))
        }.store(in: &cancellables)
    }
}
