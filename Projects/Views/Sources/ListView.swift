//
//  ListView.swift
//  Views
//
//  Created by 정재학 on 3/27/25.
//

import Combine
import Controllers
import SwiftUI

public struct ListView: View {
    private var cancellables = Set<AnyCancellable>()
    private let input = PassthroughSubject<ListViewModel.Input, Never>()
    private let viewModel = ListViewModel()
    public init() {
        bind()
    }
    
    public mutating func bind() {
        viewModel.transform(input: input.eraseToAnyPublisher()).sink { event in
            switch event {
            case .updateList(users: let users):
                
            }
        }.store(in: &cancellables)
    }

    public var body: some View {
        Text("Hello, World!")
            .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
