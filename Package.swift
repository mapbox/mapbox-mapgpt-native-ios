// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.29.0-SNAPSHOT-08-03--09-06.git-0fd5b9a"
let mapGptVersion = "24.29.0-SNAPSHOT-08-03--09-06.git-0fd5b9a"
let mapGptChecksum = "6405709f6d27f20ec58ad0335b42aef500224491ce47803fad47ceb168840bde"
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
