// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.33.0-SNAPSHOT-09-23--08-28.git-acb90f7"
let mapGptVersion = "24.33.0-SNAPSHOT-09-23--08-28.git-acb90f7"
let mapGptChecksum = "f9c08d7eefe541419767bc61934d5b8332738ec9e8e18c530dcc7d37a98a644e"
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
