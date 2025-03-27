import ProjectDescription

let project = Project(
    name: "Controllers",
    targets: [
        .target(
            name: "Controllers",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "UseCases", path: "../UseCases")
            ]
        )
    ]
)
