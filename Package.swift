// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.18.0-beta.1-SNAPSHOT-01-09--06-35.git-6d09cef"
let mapGptVersion = "24.18.0-beta.1-SNAPSHOT-01-09--06-35.git-6d09cef"
let mapGptChecksum = "f3a18b6d3a89a42f279258b724749cb95f88e46e0515cab2fec67ab1094d84b6"
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
