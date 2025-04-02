//
//  ListViewCell.swift
//  Views
//
//  Created by 정재학 on 4/2/25.
//

import Entities
import SwiftUI

struct ListViewCell: View {
    @State var userInformation: UserInformation
    
    var body: some View {
        VStack {
            Group {
                Text("Name: " + userInformation.name)
                Text("UserName: " + userInformation.username)
                Text("Email: " + userInformation.email)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    ListViewCell(userInformation: .init(id: 1, name: "Test", username: "TestNick", email: "email@test.com", address: .init(street: "street", suite: "suite", city: "seoul", zipcode: "12345", geo: .init(latitude: "38", longitude: "38")), phone: "010-1234-5678", website: "https://www.naver.com", company: .init(name: "ComponyName", catchPhrase: "CP", businesStrategy: "BS")))
}
