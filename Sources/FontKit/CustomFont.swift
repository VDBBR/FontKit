//
//  CustomFont.swift
//  FontKit
//
//  Created by Daniel Saidi on 2022-07-11.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This struct can be used to load custom fonts from an app
/// or Swift Package.
///
/// The `name` is the real font name while `displayName` can
/// be used to apply a separate display name. The `name` can
/// be used as a the default display name, family name (with
/// any type suffix removed), file name, etc., provided that
/// the various names correlate.
///
/// The static ``font(size:)`` builder can be used to create
/// platform-specific fonts, while ``swiftUIFont(fixedSize:)``,
/// ``swiftUIFont(dynamicSize:)`` and ``swiftUIFont(size:relativeTo:)``
/// can be used to create SwiftUI-specific fonts that behave
/// in different ways together with dynamic type.
public struct CustomFont: Identifiable, Sendable {

    /// Create a custom font from a file folder.
    ///
    /// - Parameters:
    ///   - name: The font name.
    ///   - displayName: The font display name, by default `name`.
    ///   - family: The font family name, by default the first name segment.
    ///   - fileName: The font file name, by default `name`.
    ///   - fileExtension: The font file extension, by default `ttf`.
    ///   - bundle: The bundle in which the font file is located.
    public init(
        name: String,
        displayName: String? = nil,
        family: String? = nil,
        fileName: String? = nil,
        fileExtension: String? = nil,
        bundle: Bundle = .main
    ) {
        self.name = name
        self.displayName = displayName ?? name
        self.family = family ?? name.defaultFamily
        self.fileName = fileName ?? name
        self.fileExtension = fileExtension ?? "ttf"
        self.bundle = bundle
        registerIfNeeded()
    }

    /// The unique font identifier.
    public var id: String { name }

    /// The font name.
    public let name: String

    /// The font display name.
    public let displayName: String

    /// The font family name.
    public let family: String

    /// The font file name.
    public let fileName: String

    /// The font file extension.
    public let fileExtension: String

    /// The bundle in which the font file is located
    public let bundle: Bundle
}

public extension CustomFont {

    /// Resolve a platform-specific font with a certain size.
    func font(size: CGFloat) -> FontRepresentable {
        if let font = tryResolveFont(size: size) { return font }
        fatalError("Unable to initialize font '\(name)'")
    }

    /// Create a SwiftUI `Font` with a dynamic size.
    ///
    /// This font adapts to the current dynamic type size.
    func swiftUIFont(dynamicSize size: CGFloat) -> Font {
        .dynamic(self, size: size)
    }

    /// Create a SwiftUI `Font` with a fixed size.
    ///
    /// This font ignores the current dynamic type size.
    func swiftUIFont(fixedSize size: CGFloat) -> Font {
        .fixed(self, size: size)
    }

    /// Create a SwiftUI `Font` with a fixed size.
    ///
    /// This font adapts to the current dynamic type size by
    /// scaling relative to the provided text style.
    func swiftUIFont(
        size: CGFloat,
        relativeTo style: Font.TextStyle
    ) -> Font {
        .relative(self, size: size, relativeTo: style)
    }
}

public extension Font {

    /// Create a custom font with a dynamic size.
    ///
    /// This font adapts to the current dynamic type size.
    static func dynamic(
      _ font: CustomFont,
      size: CGFloat
    ) -> Font {
        .custom(font.name, size: size)
    }

    /// Create a custom font with a fixed size.
    ///
    /// This font ignores the current dynamic type size.
    static func fixed(
      _ font: CustomFont,
      size: CGFloat
    ) -> Font {
        .custom(font.name, fixedSize: size)
    }

    /// Create a custom font with a style-relative size.
    ///
    /// This font adapts to the current dynamic type size by
    /// scaling relative to the provided text style. 
    static func relative(
        _ font: CustomFont,
        size: CGFloat,
        relativeTo style: Font.TextStyle
    ) -> Font {
        .custom(font.name, size: size, relativeTo: style)
    }
}

private extension String {

    var defaultFamily: String {
        String(split(separator: "-").first ?? "")
    }
}

private extension CustomFont {

    var isRegistered: Bool {
        guard let url else { return false }
        #if os(macOS) && !targetEnvironment(macCatalyst)
        return CTFontManagerGetScopeForURL(url) == .none
        #else
        let names = UIFont.fontNames(forFamilyName: family)
        return names.contains(name)
        #endif
    }

    var url: CFURL? {
        bundle.url(
            forResource: fileName,
            withExtension: fileExtension
        ) as CFURL?
    }

    func registerIfNeeded() {
        guard let url, !isRegistered else { return }
        CTFontManagerRegisterFontsForURL(url, .process, nil)
    }

    func tryResolveFont(size: Double) -> FontRepresentable? {
        .init(name: name, size: size)
    }
}
