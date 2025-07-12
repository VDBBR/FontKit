# FontKit: Simplifying Custom Font Management in SwiftUI and UIKit

![FontKit](https://img.shields.io/badge/FontKit-Easily%20handle%20custom%20fonts-blue.svg)
![GitHub Release](https://img.shields.io/github/release/VDBBR/FontKit.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Supported Platforms](#supported-platforms)
- [Contributing](#contributing)
- [License](#license)
- [Releases](#releases)

## Overview

FontKit is a powerful library designed to make handling custom fonts easy across multiple Apple platforms. Whether you are working with SwiftUI, UIKit, or AppKit, FontKit streamlines the process of integrating and managing custom fonts in your applications. This library supports various platforms, including iOS, macOS, tvOS, watchOS, and VisionOS, allowing developers to create a consistent typography experience across their apps.

## Features

- **Easy Integration**: Simple setup process for adding custom fonts.
- **Multi-Platform Support**: Works seamlessly with SwiftUI, UIKit, and AppKit.
- **Flexible API**: Offers a clear and straightforward API for font management.
- **Dynamic Font Loading**: Load fonts dynamically at runtime.
- **Font Preview**: Preview fonts directly within your app for easier selection.

## Installation

To get started with FontKit, you can install it using Swift Package Manager. Add the following line to your `Package.swift` file:

```swift
.package(url: "https://github.com/VDBBR/FontKit.git", from: "1.0.0")
```

You can also visit the [Releases](https://github.com/VDBBR/FontKit/releases) section to download the latest version of FontKit and follow the instructions to execute it in your project.

## Usage

### Importing FontKit

To use FontKit in your project, import the library at the top of your Swift files:

```swift
import FontKit
```

### Adding Custom Fonts

To add a custom font, you can use the following method:

```swift
FontKit.addFont(named: "YourCustomFontName")
```

### Using Fonts in SwiftUI

To use a custom font in SwiftUI, you can apply it directly to your text views:

```swift
Text("Hello, World!")
    .font(FontKit.font(named: "YourCustomFontName", size: 20))
```

### Using Fonts in UIKit

For UIKit, you can set the font for UILabel or UITextView like this:

```swift
label.font = FontKit.font(named: "YourCustomFontName", size: 20)
```

### Using Fonts in AppKit

In AppKit, apply the custom font to NSTextField or NSLabel as follows:

```swift
textField.font = FontKit.font(named: "YourCustomFontName", size: 20)
```

### Dynamic Font Loading

FontKit allows you to load fonts dynamically. You can load a font at runtime with:

```swift
FontKit.loadFont(named: "YourCustomFontName")
```

This is particularly useful for apps that need to support multiple languages or themes.

### Font Preview

FontKit also provides a simple way to preview fonts. Use the following code to display a font preview:

```swift
FontKit.previewFont(named: "YourCustomFontName")
```

This will show a sample text using the specified font.

## Supported Platforms

FontKit supports the following platforms:

- **iOS**
- **macOS**
- **tvOS**
- **watchOS**
- **VisionOS**

This wide support ensures that you can use FontKit in any Apple application you are developing.

## Contributing

Contributions are welcome! If you would like to contribute to FontKit, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

Make sure to include tests for any new features or bug fixes.

## License

FontKit is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Releases

You can find the latest releases of FontKit at the following link: [Releases](https://github.com/VDBBR/FontKit/releases). Download the latest version and follow the instructions to execute it in your project.

Feel free to explore the repository and check out the code. Your feedback and contributions are highly appreciated.