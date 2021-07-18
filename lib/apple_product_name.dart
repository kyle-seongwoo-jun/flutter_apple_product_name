library apple_product_name;

import 'package:device_info_plus/device_info_plus.dart';

part 'apple_product_name.g.dart';

class AppleProductName {
  static final _instance = AppleProductName._();

  AppleProductName._();

  factory AppleProductName() => _instance;

  String lookup(String machineId) => _lookup(machineId) ?? machineId;

  String? lookupOrNull(String machineId) => _lookup(machineId);
}

extension ProductName1 on IosUtsname {
  String get productName {
    if (machine == null) throw ArgumentError.notNull('machine');
    return AppleProductName().lookup(machine!);
  }

  String? get productNameOrNull =>
      machine != null ? AppleProductName().lookupOrNull(machine!) : null;
}

extension ProductName2 on MacOsDeviceInfo {
  String get productName => AppleProductName().lookup(model);

  String? get productNameOrNull => AppleProductName().lookupOrNull(model);
}
