// swift-tools-version:5.3

import Foundation
import PackageDescription

var sources = ["src/parser.c"]
if FileManager.default.fileExists(atPath: "src/scanner.c") {
    sources.append("src/scanner.c")
}

let package = Package(
    name: "TreeSitterBg3",
    products: [
        .library(name: "TreeSitterBg3", targets: ["TreeSitterBg3"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterBg3",
            dependencies: [],
            path: ".",
            sources: sources,
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterBg3Tests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterBg3",
            ],
            path: "bindings/swift/TreeSitterBg3Tests"
        )
    ],
    cLanguageStandard: .c11
)
