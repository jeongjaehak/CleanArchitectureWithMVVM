import ProjectDescription

let settings: Settings = .settings(
    base: [
        "PROJECT_BASE": "PROJECT_BASE",
    ],
    configurations: [
        .debug(name: "Debug", xcconfig: "Support/Debug.xcconfig"),
        .release(name: "Release", xcconfig: "Support/Release.xcconfig"),
    ]
)

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [.project(target: "Views", path: "../Views")]
        ),
        .target(
            name: "CleanArchitectureWithMVVMTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.CleanArchitectureWithMVVMTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "App")]
        ),
    ]
)
