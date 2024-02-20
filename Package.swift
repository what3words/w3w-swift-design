// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "w3w-swift-design",
    platforms: [.iOS(.v9)],
    
    products: [
      .library(name: "W3WSwiftDesign", targets: ["W3WSwiftDesign"]),
    ],
    
    dependencies: [
      .package(url: "https://github.com/what3words/w3w-swift-core.git", "1.0.0" ..< "2.0.0"),
      .package(url: "https://github.com/what3words/w3w-swift-themes.git", branch: "main")
    ],
    
    targets: [
      .target(
        name: "W3WSwiftDesign",
        dependencies: [
          .product(name: "W3WSwiftCore", package: "w3w-swift-core"),
          .product(name: "W3WSwiftThemes", package: "w3w-swift-themes")
        ]
      ),

        .testTarget(name: "w3w-swift-designTests", dependencies: ["W3WSwiftDesign"]),
    ]
)
