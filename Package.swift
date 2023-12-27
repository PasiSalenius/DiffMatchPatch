// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiffMatchPatch",
    products: [
        .library(
            name: "diff-match-patch",
            targets: ["diff-match-patch"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "diff-match-patch",
            path: "Sources/diff-match-patch",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .unsafeFlags(["-fno-objc-arc"])
            ]
        )
    ]
)
