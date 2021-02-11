// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "GdkPixbuf",
    products: [ .library(name: "GdkPixbuf", targets: ["GdkPixbuf"]) ],
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/mikolasstuchlik/gir2swift.git", .branch("main")),
        .package(name: "GIO", url: "https://github.com/mikolasstuchlik/SwiftGIO.git", .branch("main")),
        .package(name: "GModule", url: "https://github.com/mikolasstuchlik/SwiftGModule.git", .branch("main")),
    ],
    targets: [
	.systemLibrary(name: "CGdkPixbuf", pkgConfig: "gdk-pixbuf-2.0",
	    providers: [
		.brew(["gdk-pixbuf", "glib", "glib-networking", "gobject-introspection"]),
		.apt(["libgdk-pixbuf2.0-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
	    ]),
        .target(
            name: "GdkPixbuf", 
            dependencies: ["CGdkPixbuf", "GIO", "GModule"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))]
        ),
        .testTarget(name: "GdkPixbufTests", dependencies: ["GdkPixbuf"]),
    ]
)
