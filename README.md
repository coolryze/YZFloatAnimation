## YZFloatAnimation

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/coolryze/YZFloatAnimation/master/LICENSE)&nbsp;
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://www.apple.com/nl/ios/)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

A float animation view for iOS, based on CoreAnimation, using Swift.

![Demo](https://raw.github.com/coolryze/YZFloatAnimation/master/YZFloatAnimationDemo/Demo.gif)


## Requirements

This library requires `iOS 7.0+`, `Swift 3` and `Xcode 8.0+`.


## Usage

```swift
let image = UIImage(named: "image name") // image
let floatAnimationView = YZFloatAnimationView(image: image)
self.view.insertSubview(floatAnimationView, at: 0)
let centerPoint = CGPoint(x: x, y: y) // center point
floatAnimationView.center = centerPoint
floatAnimationView.animating(in: self.view)
```


## Installation

1. Download the file in the YZFloatAnimation subdirectory.
2. Add the `YZFloatAnimationView.swift` to your Xcode project.


## License

YZFloatAnimation is provided under the MIT license. See LICENSE file for details.