//
//  Workspace.swift
//  Config
//
//  Created by 정재학 on 3/27/25.
//

import ProjectDescription

let workspace = Workspace(
    name: "CleanArchitectureWithMVVM",
    projects: ["Projects/**"],
    additionalFiles: [
        .glob(pattern: ".gitignore"),
        .glob(pattern: "mise.toml"),
        .glob(pattern: "*.md"),
        .glob(pattern: .relativeToRoot("Configurations/**/*.xcconfig")),
    ]
)
