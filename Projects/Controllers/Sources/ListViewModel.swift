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
    
    public init() {}
    
    /// From View
    public enum Input {
        case loadUsers
    }
    
    /// To View
    public enum Output {
        case updateList( users: [UserInformation] )
    }
    
    /// View에 전달할 내용들
    private let output = PassthroughSubject<Output, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    /// 이벤트 바인딩
    /// - Parameter input: UI 이벤트
    /// - Returns: UI 업데이트
    public func transform( input: AnyPublisher<Input, Never> ) -> AnyPublisher<Output,Never> {
        input.sink { [weak self] event in
            guard let self else { return }
            switch event {
            case .loadUsers:
                loadUsers()
            }
        }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
}

// MARK: - Private Functions

private extension ListViewModel {
    /// 유저 정보를 가져온다.
    func loadUsers() {
        GetUserInformations().execute().sink { [weak self] completion in
            guard let self else { return }
            switch completion {
            case .finished:
                break
            case .failure(_):
                break
            }
        } receiveValue: { [weak self] userInformations in
            guard let self else { return }
            output.send(.updateList(users: userInformations))
        }.store(in: &cancellables)
    }
}
