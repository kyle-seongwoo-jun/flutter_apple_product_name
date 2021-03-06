# apple_product_name

[![pub package](https://img.shields.io/pub/v/apple_product_name.svg)](https://pub.dev/packages/apple_product_name)

Library for translation apple device identifier to product name (e.g. 'iPhone13,2' to 'iPhone 12')

| iOS            | macOS            |
| -------------- | ---------------- |
| ![ios image][] | ![macos image][] |

## Usage

Translates machine id to product name.

You can use this package with [device_info_plus](https://pub.dev/packages/device_info_plus) package.

```dart
import 'package:apple_product_name/apple_product_name.dart';

if (Platform.isIOS) {
  final info = await DeviceInfoPlugin().iosInfo;
  info.utsname.machine     // "iPhone13,2"
  info.utsname.productName // "iPhone 12"
} else if (Platform.isMacOS) {
  final info = await DeviceInfoPlugin().macOsInfo;
  info.model       // "iMac21,1"
  info.productName // "iMac (24-inch, M1, 2021)"
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
