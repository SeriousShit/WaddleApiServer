// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WaddleApiServer",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.1.0")),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/vapor/auth-provider.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/vapor-community/postgresql-provider.git", .upToNextMajor(from: "2.1.0")),
//        .package(url: "https://github.com/vapor/jwt-provider.git", .upToNextMajor(from: "1.3.0")),
//        .package(url: "https://github.com/nodes-vapor/sanitized.git", .upToNextMajor(from: "1.0.0")),
//        .package(url: "https://github.com/nodes-vapor/sugar.git", .upToNextMajor(from: "1.6.4"))
    ],
    targets: [
        .target(name: "App",
                dependencies: [
                    "Vapor",
                    "FluentProvider",
                    "AuthProvider",
                    "PostgreSQLProvider",
//                    "Sanitized",
//                    "JWTProvider",
//                    "Sugar"
                ],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)

