import ProjectDescription

let project = Project(
    name: "NetworkFramework",
    targets: [
        .target(
            name: "NetworkFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
