import ProjectDescription

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
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
