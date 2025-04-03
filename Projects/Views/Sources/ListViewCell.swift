//
//  ListViewCell.swift
//  Views
//
//  Created by 정재학 on 4/2/25.
//

import Entities
import SwiftUI

/// 메인 리스트에 보여줄 셀 화면
struct ListViewCell: View {
    
    // MARK: - Properties
    
    /// 유저정보
    @State var userInformation: UserInformation
    
    // MARK: - Body
    
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

// MARK: - Preview

#Preview {
    ListViewCell(userInformation: TestData.userInformation)
}
