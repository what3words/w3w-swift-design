// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "w3w-swift-design",
    platforms: [.iOS(.v9)],
    products: [
      .library(name: "W3WSwiftDesign", targets: ["W3WSwiftDesign"]),
    ],
    
    dependencies: [.package(name: "W3WSwiftCore", path: "/Users/daveduprey/Documents/src/projects/Packages/W3WSwiftCore/src/w3w-swift-core/")],
    
    targets: [
      .target(name: "W3WSwiftDesign", dependencies: ["W3WSwiftCore"], resources: [.process("Resources")]),
      .testTarget(name: "w3w-swift-designTests", dependencies: ["W3WSwiftDesign"]),
    ]
)
