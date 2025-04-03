import ProjectDescription

let project = Project(
    name: "UseCases",
    targets: [
        .target(
            name: "UseCases",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Entities", path: "../Entities")
            ]
        )
    ]
)
