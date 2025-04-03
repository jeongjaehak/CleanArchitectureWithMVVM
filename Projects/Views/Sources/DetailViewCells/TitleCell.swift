//
//  TitleCell.swift
//  Views
//
//  Created by 정재학 on 4/3/25.
//

import SwiftUI

/// 상세화면 섹션 제목
struct TitleCell: View {
    
    // MARK: - Properties
    
    /// 제목
    let text: String
    
    // MARK: - Body
    
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
    }
}

// MARK: - Preview

#Preview {
    TitleCell(text: "User Information")
}
