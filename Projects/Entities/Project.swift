import ProjectDescription

let project = Project(
    name: "Entities",
    targets: [
        .target(
            name: "Entities",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CleanArchitectureWithMVVM",
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
