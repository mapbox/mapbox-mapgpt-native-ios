// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.23.0-SNAPSHOT-04-10--02-04.git-1db1e83"
let mapGptVersion = "24.23.0-SNAPSHOT-04-10--02-04.git-1db1e83"
let mapGptChecksum = "454bcad6dc87d4769d04b35a7d6edfb8ef9b10ded54e9b0942b0706ee128c061"
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
