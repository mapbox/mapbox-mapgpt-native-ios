// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let commonVersion : Version = "24.20.0-SNAPSHOT-02-05--13-41.git-d31ef25"
let mapGptVersion = "24.20.0-SNAPSHOT-02-05--13-41.git-d31ef25"
let mapGptChecksum = "1414bd015abec856323ffc78a140c7d73cf280ae1256e810c937cc3a7f99e613"
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
