// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.35.0-SNAPSHOT-10-22--01-39.git-196645d"
let mapGptVersion = "24.35.0-SNAPSHOT-10-22--01-39.git-196645d"
let mapGptChecksum = "6a5ba5d6ab6acb1c2be4aaaa31dd8436eb1446b802ac1a5c0fc3ab8d98e7c7e2"
let releaseType = "snapshots"

let package = Package(
    name: "MapboxMapGptNative",
    platforms: [.iOS(.v13), .macOS(.v10_15), .custom("visionos", versionString: "1.0")],
    products: [
        .library(name: "MapboxMapGptNative", targets: ["MapboxMapGptNativeWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/mapbox-common-ios.git", exact: commonVersion)
    ],
    targets: [
        .target(name: "MapboxMapGptNativeWrapper", dependencies: [
            .product(name: "MapboxCommon", package: "mapbox-common-ios"),
            .target(name: "MapboxMapGptNative")
        ]),
        .binaryTarget(
            name: "MapboxMapGptNative",
            url: "https://api.mapbox.com/downloads/v2/mapbox-common-mapgpt/\(releaseType)/ios/packages/\(mapGptVersion)/MapboxCommonGpt.zip",
            checksum: mapGptChecksum
        ),
        .testTarget(
            name: "MapboxMapGptNativeTests",
            dependencies: ["MapboxMapGptNative"]
        )
    ],
    cxxLanguageStandard: .cxx17
)
