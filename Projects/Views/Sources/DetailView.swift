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
                TextCell(title: "ID") {
                    Text("\(userInformation.id)")
                }

                TextCell(title: "Name") {
                    Text(userInformation.name)
                }

                TextCell(title: "UserName") {
                    Text(userInformation.username)
                }

                TextCell(title: "Email") {
                    HyperLinkCell(title: userInformation.email,
                                  url: "mailto:\(userInformation.email)")
                }

                TextCell(title: "Address") {
                    Text(addressText)
                }

                TextCell(title: "Map") {
                    MapView(location: userInformation.address.geo,
                            pinName: userInformation.address.city)
                }

                TextCell(title: "Phone") {
                    HyperLinkCell(title: userInformation.phone,
                                  url: "tel:\(userInformation.phone)")
                }

                TextCell(title: "Website") {
                    HyperLinkCell(title: userInformation.website,
                                  url: userInformation.website)
                }

                Spacer()

                TitleCell(text: "Company Information")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)

                TextCell(title: "Name") {
                    Text(userInformation.company.name)
                }

                TextCell(title: "Catch Phrase") {
                    Text(userInformation.company.catchPhrase)
                }

                TextCell(title: "Business Strategy") {
                    Text(userInformation.company.businesStrategy)
                }
            }
        }
        .toolbarBackground(Color.white, for: .navigationBar)
    }
}

// MARK: - Preview

#Preview {
    DetailView(userInformation: TestData.userInformation)
}
