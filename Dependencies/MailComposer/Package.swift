// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MailComposer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MailComposer",
            targets: ["MailComposer"]),
    ],
    dependencies: [
    
    ],
    targets: [
        .target(
            name: "MailComposer",
            dependencies: [])
    ]
)
