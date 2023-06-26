import 'dart:io';

import 'package:apple_product_name/apple_product_name.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> _loadProductName() async {
    if (Platform.isIOS) {
      final info = await DeviceInfoPlugin().iosInfo;
      return info.utsname.productName;
    } else if (Platform.isMacOS) {
      final info = await DeviceInfoPlugin().macOsInfo;
      return info.productName;
    }
    assert(false, 'Platform not supported');
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apple Product Name'),
        ),
        body: FutureBuilder<String>(
          future: _loadProductName(),
          builder: (context, snapshot) {
            final productName = snapshot.data ?? 'Loading...';
            return Center(
              child: Text(
                productName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }
}
