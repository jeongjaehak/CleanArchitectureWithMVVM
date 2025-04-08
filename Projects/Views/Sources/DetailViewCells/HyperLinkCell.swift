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
    /// 터치 시 이동할 URL 문자열
    let url: String
    
    // MARK: - Body

    var body: some View {
        if let fixedURL = makeValidURL(from: url) {
            Link(destination: fixedURL) {
                Text(title)
                    .foregroundColor(.blue)
                    .underline()
                    .multilineTextAlignment(.leading)
            }
        } else {
            // URL 오류인 경우
            Text("잘못된 URL: \(url)")
                .foregroundColor(.red)
        }
    }

    // MARK: - Helper
    
    /// URL 스킴을 자동 보정하여 URL 객체로 변환
    private func makeValidURL(from urlString: String) -> URL? {
        // 이미 유효한 스킴이 붙어 있는 경우 그대로 사용
        if urlString.hasPrefix("http://") ||
            urlString.hasPrefix("https://") ||
            urlString.hasPrefix("mailto:") ||
            urlString.hasPrefix("tel:") {
            return URL(string: urlString)
        }
        // 스킴이 없는 경우 https://를 기본으로 추가
        return URL(string: "https://\(urlString)")
    }
}

// MARK: - Preview

#Preview {
    HyperLinkCell(title: "네이버", url: "https://www.naver.com")

}
