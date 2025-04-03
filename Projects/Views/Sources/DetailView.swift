//
//  DetailView.swift
//  Views
//
//  Created by 정재학 on 4/1/25.
//

import Entities
import SwiftUI

/// 상세화면
public struct DetailView: View {
    
    // MARK: - Properties
    
    /// 상세화면에 보여줄 유저정보
    @State var userInformation: UserInformation
    /// 주소 표시용 텍스트
    private let addressText: String
    
    // MARK: - Init
    
    public init(userInformation: UserInformation) {
        self.userInformation = userInformation
        let address = userInformation.address
        self.addressText = "[\(address.zipcode)] " + address.city + " " + address.street + " " + address.suite
    }
    
    // MARK: - Body
    
    public var body: some View {
        ScrollView {
            Spacer(minLength: 16)
            VStack(spacing: 8) {
                TitleCell(text: "User Information")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextCell(title: "ID", content: Text("\(userInformation.id)"))
                TextCell(title: "Name", content: Text(userInformation.name))
                TextCell(title: "UserName", content: Text(userInformation.username))
                TextCell(title: "Email", content: HyperLinkCell(title: userInformation.email,
                                                                url: "mailto:"+userInformation.email))
                TextCell(title: "Address", content: Text(addressText))
                TextCell(title: "Map", content: MapView(location: userInformation.address.geo, pinName: userInformation.address.city))
                TextCell(title: "Phone", content: HyperLinkCell(title: userInformation.phone,
                                                                url: "tel:"+userInformation.phone))
                TextCell(title: "Website", content: HyperLinkCell(title: userInformation.website,
                                                                url: userInformation.website))
                
                Spacer()
                
                TitleCell(text: "Company Information")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextCell(title: "Name", content: Text(userInformation.company.name))
                TextCell(title: "Catch Phrase", content: Text(userInformation.company.catchPhrase))
                TextCell(title: "Busines Strategy", content: Text(userInformation.company.businesStrategy))
            }
        }
        .toolbarBackground(Color.white, for: .navigationBar)
    }
}

// MARK: - Preview

#Preview {
    DetailView(userInformation: TestData.userInformation)
}
