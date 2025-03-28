//
//  ListView.swift
//  Views
//
//  Created by 정재학 on 3/27/25.
//

import Combine
import Entities
import NetworkFramework
import SwiftUI

public struct ListView: View {
    var test = Set<AnyCancellable>()
    
    public init() {
        
        APIUsers().request().sink { completion in
            switch completion {
            case .finished:
                print( "성공" )
            case .failure( let error ):
                print( "error: \(error.localizedDescription)" )
            }
        } receiveValue: { userInfo in
            print( "userInfo: \(userInfo)" )
        }.store(in: &test)

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
