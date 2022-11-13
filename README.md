# apple_product_name

[![pub package](https://img.shields.io/pub/v/apple_product_name.svg)](https://pub.dev/packages/apple_product_name)
[![pub points](https://img.shields.io/pub/points/apple_product_name?color=2E8B57&label=pub%20points)](https://pub.dev/packages/apple_product_name/score)
[![device_info_plus](https://github.com/kyle-seongwoo-jun/flutter_apple_product_name/actions/workflows/flutter.yml/badge.svg)](https://github.com/kyle-seongwoo-jun/flutter_apple_product_name/actions/workflows/flutter.yml)

Library for translating Apple machine identifiers into Apple product names (e.g. `iPhone15,2` to `iPhone 14 Pro`)

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
  print(info.utsname.machine);      // "iPhone15,2"
  print(info.utsname.productName);  // "iPhone 14 Pro"
} else if (Platform.isMacOS) {
  final info = await DeviceInfoPlugin().macOsInfo;
  print(info.model);        // "Mac14,2"
  print(info.productName);  // "MacBook Air (M2, 2022)"
}
```

Also, you can use without device_info_plus package dependency.

```dart
AppleProductName().lookup('iPad13,10')
// iPad Pro 5th Gen (12.9 inch, WiFi+Cellular)
```

## Sources

- iOS: [fieldnotescommunities/ios-device-identifiers](https://github.com/fieldnotescommunities/ios-device-identifiers)
- macOS: [kyle-seongwoo-jun/mac-device-identifiers](https://github.com/kyle-seongwoo-jun/mac-device-identifiers)

[ios image]: https://raw.githubusercontent.com/kyle-seongwoo-jun/flutter_apple_product_name/main/images/ios.png
[macos image]: https://raw.githubusercontent.com/kyle-seongwoo-jun/flutter_apple_product_name/main/images/macos.png
