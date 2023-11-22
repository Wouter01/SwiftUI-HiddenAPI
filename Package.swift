// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-HiddenAPI",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "HiddenAPI",
            targets: ["HiddenAPI"]),
    ],
    targets: [
        .binaryTarget(name: "HiddenAPI", path: "Sources/HiddenAPI.xcframework")
    ]
)
