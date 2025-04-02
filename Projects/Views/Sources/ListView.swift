//
//  ListView.swift
//  Views
//
//  Created by 정재학 on 3/27/25.
//

import Combine
import Controllers
import Entities
import SwiftUI

/// 첫 리스트 보여주는 화면
public struct ListView: View {
    
    // MARK: - Properties
    
    private var cancellables = Set<AnyCancellable>()
    private let input = PassthroughSubject<ListViewModel.Input, Never>()
    private var viewModel = ListViewModel()
    @State private var userInformations = [UserInformation]()
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Body
    
    public var body: some View {
        NavigationView {
            List() {
                Section(header: Text("정재학의 포트폴리오")) {
                    //                    List(userInformations, id:\.self) { userInfo in
                    ForEach(userInformations, id: \.id) { userInfo in
                        NavigationLink {
                            // 터치 시 상세화면 진입
                            DetailView(userInformation: userInfo)
                            
                        } label: {
                            // 각 셀에서 보여줄 정보화면
                            ListViewCell(userInformation: userInfo)
                        }
                    }
                }
            }
        }
        .clipped() // clipToBounds
        .scrollContentBackground(.hidden) // 스크롤 배경 숨김
        .background(Color.white)    // 배경 흰색 처리
        .onAppear() {
            // 서버에서 데이터 로드
            input.send(.loadUsers)
        }
        .onReceive(viewModel.transform(input: input.eraseToAnyPublisher())) { event in
            switch event {
                // 새로운 데이터가 들어오면 갱신한다.
            case .updateList(users: let users):
                userInformations = users
            }
        }
    }
}

// MARK: - Preview

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
