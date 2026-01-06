// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.19.0-SNAPSHOT-01-06--04-32.git-c1f07e9"
let mapGptVersion = "24.19.0-SNAPSHOT-01-06--04-32.git-c1f07e9"
let mapGptChecksum = "a259d4866e89c92439ff57d2a482fdb3f9dae969f794a22ce9182058c739f76e"
let releaseType = "snapshots"

let package = Package(
    name: "MapboxMapGpt",
    platforms: [.iOS(.v13), .macOS(.v10_15), .custom("visionos", versionString: "1.0")],
    products: [
        .library(name: "MapboxMapGpt", targets: ["MapboxMapGptWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/mapbox-common-ios.git", exact: commonVersion)
    ],
    targets: [
        .target(name: "MapboxMapGptWrapper", dependencies: [
            .product(name: "MapboxCommon", package: "mapbox-common-ios"),
            .target(name: "MapboxMapGpt")
        ]),
        .binaryTarget(
            name: "MapboxMapGpt",
            url: "https://api.mapbox.com/downloads/v2/mapbox-common-mapgpt/\(releaseType)/ios/packages/\(mapGptVersion)/MapboxCommonGpt.zip",
            checksum: mapGptChecksum
        ),
        .testTarget(
            name: "MapboxMapGptTests",
            dependencies: ["MapboxMapGpt"]
        )
    ],
    cxxLanguageStandard: .cxx17
)
