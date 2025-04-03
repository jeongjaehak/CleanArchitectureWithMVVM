//
//  HyperLinkCell.swift
//  Views
//
//  Created by 정재학 on 4/3/25.
//

import SwiftUI

/// 하이퍼링크를 표현하는 뷰
struct HyperLinkCell: View {
    
    // MARK: - Properties
    
    /// 표시할 텍스트
    let title: String
    /// 터치 시 이동할 URL
    let url: String
    
    // MARK: - Body

    var body: some View {
        if let linkURL = URL(string: url) {
            Link(destination: linkURL) {
                Text(title)
                    .foregroundColor(.blue)
                    .underline()
            }
        } else {
            // URL 오류인 경우
            Text("URL:\"\(url)\"")
                .foregroundColor(.red)
        }
    }
}

// MARK: - Preview

#Preview {
    HyperLinkCell(title: "네이버", url: "https://www.naver.com")

}
