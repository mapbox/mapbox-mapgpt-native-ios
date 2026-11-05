// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.31.1-SNAPSHOT-11-05--09-25.git-7b8bc6e"
let mapGptVersion = "24.31.1-SNAPSHOT-11-05--09-25.git-7b8bc6e"
let mapGptChecksum = "c6a60fbf4442f16d9a20076cb0d71c4c23d16e24b56036d5b527db3548e484dd"
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
