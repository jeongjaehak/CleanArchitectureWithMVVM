//
//  Settings+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by 정재학 on 4/4/25.
//

import ProjectDescription

extension Settings {
    
    /// 프로젝트 설정하기
    /// - Parameter config: 개발/운영
    /// - Returns: 프로젝트 설정값
    public static func commonSettings( config: Configuration ) -> Settings {
        .settings(
            base: SettingsDictionary()
                .merging([
                    "DEVELOPMENT_TEAM":"MEFB27FAAD",
                    "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "YES"
                ])
                .otherLinkerFlags([
                    "-weak_framework SwiftUI"
                ]),
            configurations: [.debug, .release]
            )
    }
}
