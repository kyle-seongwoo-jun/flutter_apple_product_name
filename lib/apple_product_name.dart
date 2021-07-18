library apple_product_name;

part 'apple_product_name.g.dart';

class AppleProductName {
  static final _instance = AppleProductName._();

  AppleProductName._();

  factory AppleProductName() => _instance;

  String lookup(String machineId) => _lookup(machineId) ?? machineId;

  String? lookupOrNull(String machineId) => _lookup(machineId);
}
