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
    
    private var viewModel = ListViewModel()
    private let input = PassthroughSubject<ListViewModel.Input, Never>()
    @State private var userInformations = [UserInformation]()
    
    // MARK: - Init
    
    public init() {}

    // MARK: - Body
    
    public var body: some View {
        NavigationView {
            List(userInformations, id: \.id) { userInfo in
                NavigationLink(destination: DetailView(userInformation: userInfo)) {
                    ListViewCell(userInformation: userInfo)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("정재학의 포트폴리오")
            .toolbarBackground(Color.white, for: .navigationBar)
        }
        .clipped()
        .scrollContentBackground(.hidden)
        .background(Color.white)
        .onAppear(perform: loadUsers)
        .onReceive(viewModel.transform(input: input.eraseToAnyPublisher())) { event in
            switch event {
            case .updateList(users: let users):
                userInformations = users
            }
        }
    }
}

// MARK: - Private Functions

extension ListView {
    private func loadUsers() {
        input.send(.loadUsers)
    }
}

// MARK: - Preview

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
