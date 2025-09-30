/// Library for translating Apple machine identifiers into Apple product names.
library apple_product_name;

import 'package:device_info_plus/device_info_plus.dart';

part 'apple_product_name.g.dart';

/// Translates the machine identifiers into Apple product names.
class AppleProductName {
  static final _instance = AppleProductName._();

  AppleProductName._();

  /// Returns the singleton instance of [AppleProductName].
  factory AppleProductName() => _instance;

  /// Returns the product name for the given machine id.
  String lookup(String machineId) => _lookup(machineId) ?? machineId;

  /// Returns the product name for the given machine id or `null` if the machine
  /// id is not known.
  String? lookupOrNull(String machineId) => _lookup(machineId);
}

/// Extension getters for [IosUtsname] to get the product name.
extension IosProductName on IosUtsname {
  /// Returns the product name of the device.
  @Deprecated('Use IosDeviceInfo.modelName instead')
  String get productName => AppleProductName().lookup(machine);

  /// Returns the product name of the device or `null` if the product name is not
  /// found.
  @Deprecated('Use IosDeviceInfo.modelName instead')
  String? get productNameOrNull => AppleProductName().lookupOrNull(machine);
}

/// Extension getters for [MacOsDeviceInfo] to get the product name.
extension MacOsProductName on MacOsDeviceInfo {
  /// Returns the product name of the device.
  @Deprecated('Use modelName instead')
  String get productName => AppleProductName().lookup(model);

  /// Returns the product name of the device or `null` if the product name is not
  /// found.
  @Deprecated('Use modelName instead')
  String? get productNameOrNull => AppleProductName().lookupOrNull(model);
}
