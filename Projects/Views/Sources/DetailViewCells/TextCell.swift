//
//  TextCell.swift
//  Views
//
//  Created by 정재학 on 4/2/25.
//

import SwiftUI

/// 제목과 컨텐츠 뷰가 한쌍으로 묶인 뷰
struct TextCell<Content:View>: View {
    
    // MARK: - Properties
    
    /// 제목
    let title: String
    /// 보여줄 내용 뷰
    @ViewBuilder let content: () -> Content
   
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: 100, alignment: .leading)
                .padding(.leading, 16)
            content()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: - Preview

#Preview {
    TextCell(title: "title") {
        Text("value")
    }
}
