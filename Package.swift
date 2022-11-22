// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iCOM_Service",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iCOM_Service",
            targets: ["iCOM_Service"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Pimine/SVProgressHUD.git", branch: "master"),
        .package(url: "https://github.com/ReactiveX/RxSwift", branch: "main"),
        .package(url: "https://github.com/AalokParikh/RangeSeekSlider", branch: "master"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "iCOM_Service",
            dependencies: ["SVProgressHUD", "RxSwift", "RangeSeekSlider", "Alamofire", .product(name: "RxCocoa", package: "RxSwift")]),
        .testTarget(
            name: "iCOM_ServiceTests",
            dependencies: ["iCOM_Service", "SVProgressHUD", "RxSwift", "RangeSeekSlider", "Alamofire", .product(name: "RxCocoa", package: "RxSwift")]),
    ]
)
