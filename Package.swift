// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWJavaScriptContext_ChineseConvert",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "WWJavaScriptContext_ChineseConvert", targets: ["WWJavaScriptContext_ChineseConvert"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWJavaScriptContext", from: "1.0.3"),
    ],
    targets: [
        .target(name: "WWJavaScriptContext_ChineseConvert", dependencies: ["WWJavaScriptContext"], resources: [.process("Script"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
