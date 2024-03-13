// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWJavaScriptContext+ChineseConvert",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "WWJavaScriptContext+ChineseConvert", targets: ["WWJavaScriptContext+ChineseConvert"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWJavaScriptContext", from: "1.0.3"),
    ],
    targets: [
        .target(name: "WWJavaScriptContext+ChineseConvert", dependencies: ["WWJavaScriptContext"], resources: [.process("Script"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
