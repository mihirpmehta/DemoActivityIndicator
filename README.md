# DemoActivityIndicator

[![CI Status](https://img.shields.io/travis/mihirpmehta/DemoActivityIndicator.svg?style=flat)](https://travis-ci.org/mihirpmehta/DemoActivityIndicator)
[![Version](https://img.shields.io/cocoapods/v/DemoActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/DemoActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/DemoActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/DemoActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/DemoActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/DemoActivityIndicator)

### DemoActivityIndicator is an UI Activity indicator which prevents any UI interaction on View controller inculding Navigatiobar, You can also display custom text as a meesage

## Requirements

- iOS 12.0+ 
- Xcode 10.0+
- Swift 4.2

## Communication

Contact us at mihirpmehta@gmail.com

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DemoActivityIndicator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DemoActivityIndicator'
```

## Author

Mihir, mihirpmehta@gmail.com

## Usage 


## Usage 


First thing is to import the framework. See the Installation instructions on how to add the framework to your project.

```swift
import DemoActivityIndicator
```
If you want to just display activity indicator 

```swift
self.showActivityIndicator()
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    self.hideActivityIndicator()
}
```

If you want to display activity indicator with message 

```swift
self.showActivityIndicator(isHidden: false, message: "With great power comes great responsibility")
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    self.hideActivityIndicator()
}
```

## License

DemoActivityIndicator is available under the MIT license. See the LICENSE file for more info.
