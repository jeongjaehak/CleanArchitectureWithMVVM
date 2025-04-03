import ProjectDescription

let project = Project(
    name: "Views",
    targets: [
        .target(
            name: "Views",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Controllers", path: "../Controllers")
            ]
        )
    ]
)
