import ProjectDescription

let project = Project(
    name: "NetworkFramework",
    targets: [
        .target(
            name: "NetworkFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
