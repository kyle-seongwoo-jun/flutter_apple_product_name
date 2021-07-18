import 'package:apple_product_name/apple_product_name.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('lookup product name with machine id', () {
    expect(
      AppleProductName().lookup('x86_64'),
      'iOS Simulator 64-bit',
    );
    expect(
      AppleProductName().lookup('iPhone13,2'),
      'iPhone 12',
    );
    expect(
      AppleProductName().lookup('iPad13,10'),
      'iPad Pro 5th Gen (12.9 inch, WiFi+Cellular)',
    );
    expect(
      AppleProductName().lookup('iMac21,1'),
      'iMac (24-inch, M1, 2021)',
    );
    expect(
      AppleProductName().lookup('MacBookPro17,1'),
      'MacBook Pro (13-inch, M1, 2020)',
    );
  });

  test('lookup with machine id that not exists', () {
    expect(
      AppleProductName().lookup('iPhone999,1'),
      'iPhone999,1',
    );
    expect(
      AppleProductName().lookupOrNull('iPhone999,1'),
      null,
    );
  });
}
