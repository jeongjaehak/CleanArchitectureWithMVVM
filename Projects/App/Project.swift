import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "App",
//    settings: Settings.commonSettings(config: .debug),
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
