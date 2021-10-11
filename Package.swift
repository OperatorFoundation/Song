// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(macOS)
let package = Package(
    name: "Song",
    platforms: [.macOS(.v10_14)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Song",
            targets: ["Song"]),
        .library(
            name: "Composition",
            targets: ["Composition"]),
        .library(
            name: "Chorus",
            targets: ["Chorus"]),
        .library(
            name: "Symphony",
            targets: ["Symphony"]),
        .library(
            name: "Package",
            targets: ["Package"]),
        .library(
            name: "Expressible",
            targets: ["Expressible"]),
        .library(
            name: "SongExpressible",
            targets: ["SongExpressible"]),
        .executable(
            name: "compose",
            targets: ["compose"]),
        .executable(
            name: "choir",
            targets: ["choir"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/OperatorFoundation/swift-ast.git", from: "0.19.11"),
        .package(url: "https://github.com/OperatorFoundation/Datable", from: "3.1.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Song",
            dependencies: [.product(name: "SwiftAST", package: "swift-ast"), "Datable", "Expressible"]),
        .target(
            name: "Composition",
            dependencies: ["Datable"]),
        .target(
            name: "Chorus",
            dependencies: []),
        .target(
            name: "Symphony",
            dependencies: ["Song"]),
        .target(
            name: "Package",
            dependencies: []),
        .target(
            name: "compose",
            dependencies: ["Composition",
                           .product(name: "SwiftAST", package: "swift-ast")]),
        .target(
            name: "choir",
            dependencies: ["Chorus", "Datable", "Package",
                           .product(name: "SwiftAST", package: "swift-ast")]),
        .target(
            name: "Expressible",
            dependencies: [.product(name: "SwiftAST", package: "swift-ast")]),
        .target(
            name: "SongExpressible",
            dependencies: ["Song", "Expressible"]),
        .testTarget(name: "ExpressibleTests",
                    dependencies: ["Song", "Expressible", "SongExpressible"]),
        .testTarget(
            name: "SongTests",
            dependencies: ["Song", "Composition", "Datable"]),
        .testTarget(
            name: "SymphonyTests",
            dependencies: ["Song", "Symphony", "Datable"]),
    ],
    swiftLanguageVersions: [.v5]
)
#else
let package = Package(
    name: "Song",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Song",
            targets: ["Song"]),
        .library(
            name: "Composition",
            targets: ["Composition"]),
        .library(
            name: "Chorus",
            targets: ["Chorus"]),
        .library(
            name: "Symphony",
            targets: ["Symphony"]),
        .library(
            name: "Package",
            targets: ["Package"]),
        .library(
            name: "Expressible",
            targets: ["Expressible"]),
        .library(
            name: "SongExpressible",
            targets: ["SongExpressible"]),
        .executable(
            name: "compose",
            targets: ["compose"]),
        .executable(
            name: "choir",
            targets: ["choir"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/yanagiba/swift-ast", from: "0.4.2"),
        .package(url: "https://github.com/OperatorFoundation/Datable", from: "3.0.2"),
        .package(url: "https://github.com/OperatorFoundation/NetworkLinux", from: "0.2.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Song",
            dependencies: [.product(name: "SwiftAST", package: "swift-ast"), "Datable", "Expressible"]),
        .target(
            name: "Composition",
            dependencies: ["Datable",
                           .product(name: "NetworkLinux", package: "NetworkLinux")]),
        .target(
            name: "Chorus",
            dependencies: []),
        .target(
            name: "Symphony",
            dependencies: ["Song"]),
        .target(
            name: "Package",
            dependencies: []),
        .target(
            name: "compose",
            dependencies: ["Composition",
                           .product(name: "SwiftAST", package: "swift-ast")]),
        .target(
            name: "choir",
            dependencies: ["Chorus", "Datable", "Package",
                           .product(name: "SwiftAST", package: "swift-ast"),
                           .product(name: "NetworkLinux", package: "NetworkLinux")]),
        .target(
            name: "Expressible",
            dependencies: [.product(name: "SwiftAST", package: "swift-ast"),
                           .product(name: "NetworkLinux", package: "NetworkLinux")]),
        .target(
            name: "SongExpressible",
            dependencies: ["Song", "Expressible"]),
        .testTarget(name: "ExpressibleTests",
                    dependencies: ["Song", "Expressible", "SongExpressible"]),
        .testTarget(
            name: "SongTests",
            dependencies: ["Song", "Composition", "Datable"]),
        .testTarget(
            name: "SymphonyTests",
            dependencies: ["Song", "Symphony", "Datable"]),
    ],
    swiftLanguageVersions: [.v5]
)
#endif
