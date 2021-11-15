// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "NinjaKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "NinjaKit",
            targets: ["NinjaKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "NinjaKit",
            dependencies: []),
        .testTarget(
            name: "NinjaKitTests",
            dependencies: ["NinjaKit"]),
    ]
)

