import ProjectDescription

let project = Project(
    name: "CleanArchitectureWithMVVM",
    targets: [
        .target(
            name: "CleanArchitectureWithMVVM",
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
            sources: ["CleanArchitectureWithMVVM/Sources/**"],
            resources: ["CleanArchitectureWithMVVM/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "CleanArchitectureWithMVVMTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.CleanArchitectureWithMVVMTests",
            infoPlist: .default,
            sources: ["CleanArchitectureWithMVVM/Tests/**"],
            resources: [],
            dependencies: [.target(name: "CleanArchitectureWithMVVM")]
        ),
    ]
)
