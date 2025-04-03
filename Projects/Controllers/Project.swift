import ProjectDescription

let project = Project(
    name: "Controllers",
    targets: [
        .target(
            name: "Controllers",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "UseCases", path: "../UseCases")
            ]
        )
    ]
)
