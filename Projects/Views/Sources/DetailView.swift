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
    /// 유저정보 셀의 타이틀 문자열
    private let userInfoTitles = [
        "ID", "Name", "UserName", "Email", "Address", "Map", "Phone", "Website"
    ]
    /// 회사정보 셀의 타이틀 문자열
    private let companyInfoTitles = [
        "Name", "Catch Phrase", "Business Strategy"
    ]
    
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
            VStack(alignment: .leading, spacing: 8) {
                TitleCell(text: "User Information")
                Text("ID: \(userInformation.id)")
                Text("Name: " + userInformation.name)
                Text("UserName: " + userInformation.username)
                HStack {
                    Text("Email: ")
                    HyperLinkCell(title: userInformation.email,
                                  url: "mailto:\(userInformation.email)")
                }
                Text("Address: " + addressText)
                MapView(location: userInformation.address.geo,
                        pinName: userInformation.address.city)
                HStack {
                    Text("Phone: ")
                    HyperLinkCell(title: userInformation.phone,
                                  url: "tel:\(userInformation.phone)")
                }
                HStack {
                    Text("Website: ")
                    HyperLinkCell(title: userInformation.website,
                                  url: userInformation.website)
                }

                Spacer()
                Divider()
                
                TitleCell(text: "Company Information")
                Text("Name: " + userInformation.company.name)
                Text("Catch Phrase: " + userInformation.company.catchPhrase)
                Text("Business Strategy: " + userInformation.company.businesStrategy)
            }.padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
    }
}

// MARK: - Preview

#Preview {
    DetailView(userInformation: TestData.userInformation)
}
