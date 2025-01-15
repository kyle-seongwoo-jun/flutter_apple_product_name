# apple_product_name

[![pub package](https://img.shields.io/pub/v/apple_product_name)](https://pub.dev/packages/apple_product_name)
[![pub points](https://img.shields.io/pub/points/apple_product_name?color=2E8B57&label=pub%20points)](https://pub.dev/packages/apple_product_name/score)
[![pub downloads](https://img.shields.io/pub/dm/apple_product_name)](https://pub.dev/packages/apple_product_name/score)
[![flutter ci](https://github.com/kyle-seongwoo-jun/flutter_apple_product_name/actions/workflows/flutter.yml/badge.svg)](https://github.com/kyle-seongwoo-jun/flutter_apple_product_name/actions/workflows/flutter.yml)

Library for translating Apple machine identifiers into Apple product names (e.g. `iPhone17,1` to `iPhone 16 Pro`)

| iOS            | macOS            |
| -------------- | ---------------- |
| ![ios image][] | ![macos image][] |

## Usage

Translates machine id to product name.

You can use this package with [device_info_plus](https://pub.dev/packages/device_info_plus) package.

```dart
import 'package:apple_product_name/apple_product_name.dart';
import 'package:device_info_plus/device_info_plus.dart';

if (Platform.isIOS) {
  final info = await DeviceInfoPlugin().iosInfo;
  print(info.utsname.machine);      // "iPhone17,1"
  print(info.utsname.productName);  // "iPhone 16 Pro"
} else if (Platform.isMacOS) {
  final info = await DeviceInfoPlugin().macOsInfo;
  print(info.model);        // "Mac14,2"
  print(info.productName);  // "MacBook Air (M2, 2022)"
}
```

Or you can use `AppleProductName` class directly without `device_info_plus` package.

```dart
AppleProductName().lookup('iPad16,5')
// iPad Pro 13-inch (M4)
```

## Source

- [kyle-seongwoo-jun/apple-device-identifiers](https://github.com/kyle-seongwoo-jun/apple-device-identifiers)

[ios image]: https://raw.githubusercontent.com/kyle-seongwoo-jun/flutter_apple_product_name/main/images/ios.png
[macos image]: https://raw.githubusercontent.com/kyle-seongwoo-jun/flutter_apple_product_name/main/images/macos.png
