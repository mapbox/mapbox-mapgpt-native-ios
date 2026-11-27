// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.37.0-SNAPSHOT-11-27--10-09.git-3788597"
let mapGptVersion = "24.37.0-SNAPSHOT-11-27--10-09.git-3788597"
let mapGptChecksum = "2f3ab7393a6d15d8432f1a8908f8accb3d71f0ee8706129a649aed0d83e5092f"
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
