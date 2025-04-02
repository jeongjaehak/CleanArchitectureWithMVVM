//
//  TextCell.swift
//  Views
//
//  Created by 정재학 on 4/2/25.
//

import SwiftUI

struct TextCell: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: 100, alignment: .leading)
                .padding(.leading, 16)
            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    TextCell(title: "title", value: "value")
}
