import ProjectDescription

let project = Project(
    name: "Entities",
    targets: [
        .target(
            name: "Entities",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "NetworkFramework", path: "../NetworkFramework")
            ]
        )
    ]
)
