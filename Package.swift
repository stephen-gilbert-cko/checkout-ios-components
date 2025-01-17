// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "checkout-ios-components",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "checkout-ios-components",
            targets: ["checkout-ios-components"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "checkout-ios-components"),
        .testTarget(
            name: "checkout-ios-componentsTests",
            dependencies: ["checkout-ios-components"]
        ),
    ]
)
