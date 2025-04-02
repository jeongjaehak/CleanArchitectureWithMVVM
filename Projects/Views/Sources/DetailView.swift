//
//  DetailView.swift
//  Views
//
//  Created by 정재학 on 4/1/25.
//

import Entities
import SwiftUI

public struct DetailView: View {
    
    @State var userInformation: UserInformation
    
    public var body: some View {
        ScrollView {
            TextCell(title: "Name", value: userInformation.name)
            TextCell(title: "UserName", value: userInformation.username)
            TextCell(title: "Email", value: userInformation.email)
        }
        .toolbarBackground(Color.white, for: .navigationBar)
    }
}

#Preview {
    DetailView(userInformation: .init(id: 1, name: "Test", username: "TestNick", email: "email@test.com", address: .init(street: "street", suite: "suite", city: "seoul", zipcode: "12345", geo: .init(latitude: "38", longitude: "38")), phone: "010-1234-5678", website: "https://www.naver.com", company: .init(name: "ComponyName", catchPhrase: "CP", businesStrategy: "BS")))
}
