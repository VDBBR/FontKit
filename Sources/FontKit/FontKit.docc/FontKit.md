# ``FontKit``

Easily handle custom fonts in SwiftUI, UIKit, and AppKit.


## Overview

![FontKit logo](Logo.png)

FontKit is a Swift library that makes it easy to use custom fonts with SwiftUI, UIKit, and AppKit.



## Installation

FontKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/FontKit.git
```



## Support My Work

You can [become a sponsor][Sponsors] to help me dedicate more time on my various [open-source tools][OpenSource]. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed.



## Getting Started

FontKit has a ``CustomFont`` struct that can be used to define and load custom font resources from any bundle.

For instance, this is how FontKit defines the four OpenDyslexic fonts that are embedded in the package's `.module` bundle:

```swift
public extension CustomFont {

    /// A regular OpenDyslexic font variant.
    static let openDyslexic = CustomFont(
        name: "OpenDyslexic-Regular",
        displayName: "OpenDyslexic Regular",
        fileExtension: "otf",
        bundle: .module
    )

    /// A bold OpenDyslexic font variant.
    static let openDyslexicBold = CustomFont(
        name: "OpenDyslexic-Bold",
        displayName: "OpenDyslexic Bold",
        fileExtension: "otf",
        bundle: .module
    )

    /// A bold italic OpenDyslexic font variant.
    static let openDyslexicBoldItalic = CustomFont(
        name: "OpenDyslexic-Bold-Italic",
        displayName: "OpenDyslexic Bold Italic",
        fileExtension: "otf",
        bundle: .module
    )

    /// An italic OpenDyslexic font variant.
    static let openDyslexicItalic = CustomFont(
        name: "OpenDyslexic-Italic",
        displayName: "OpenDyslexic Italic",
        fileExtension: "otf",
        bundle: .module
    )
}
```

You can use ``SwiftUICore/Font`` extensions to create ``CustomFont``-based fonts, or the ``CustomFont/font(size:)`` builder to create fonts for UIKit and AppKit.



## Repository

For more information, source code, etc., visit the [project repository](https://github.com/danielsaidi/FontKit).



## Demo App

The [project repository](https://github.com/danielsaidi/FontKit) has a demo app that lets you test the library and its various fonts.



## License

FontKit is available under the MIT license.



## Topics

### Fonts

- ``CustomFont``



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi
