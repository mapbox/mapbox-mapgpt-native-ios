// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.33.0-SNAPSHOT-09-23--15-14.git-e3358bc"
let mapGptVersion = "24.33.0-SNAPSHOT-09-23--15-14.git-e3358bc"
let mapGptChecksum = "9d4752e3dad81defba4cad4f383b19b8cd3ba250846e77cddb64fdd0ef5439dd"
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
