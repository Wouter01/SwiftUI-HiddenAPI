// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIHidden",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "SwiftUIHidden",
            targets: ["SwiftUIHidden"]),
    ],
    targets: [
        .binaryTarget(name: "SwiftUIHidden", path: "Sources/SwiftUIHidden.xcframework")
    ]
)
