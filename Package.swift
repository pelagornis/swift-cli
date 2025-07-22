// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "swift-cli",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(name: "example-cli", targets: ["ExampleCommandLine"]),
        .library(
            name: "CommandLine",
            targets: ["CommandLine"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.4.5")
    ],
    targets: [
        .executableTarget(
            name: "ExampleCommandLine",
            dependencies: [
                "CommandLine"
            ]
        ),
        .target(name: "CommandLine"),
        .testTarget(
            name: "CommandLineTests",
            dependencies: ["CommandLine"]
        ),
    ]
)
