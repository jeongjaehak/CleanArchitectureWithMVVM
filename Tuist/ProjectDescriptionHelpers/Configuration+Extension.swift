//
//  Configuration+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by 정재학 on 4/7/25.
//

import ProjectDescription

extension ConfigurationName {
    public static let debug: ConfigurationName = ConfigurationName(stringLiteral: "DebugConfig")
    public static let release: ConfigurationName = ConfigurationName(stringLiteral: "ReleaseConfig")
}

// MARK: - 개발/운영 Config 따로 적용하기 위함

extension Configuration {
    public static let debug: Configuration = .debug(
        name: .debug,
        xcconfig: .relativeToRoot("Configurations/\(ConfigurationName.debug.rawValue).xcconfig")
    )
    
    public static let release: Configuration = .release(
        name: .release,
        xcconfig: .relativeToRoot("Configurations/\(ConfigurationName.release.rawValue).xcconfig")
    )
}
