import 'dart:io';

import 'package:apple_product_name/apple_product_name.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? productName;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      DeviceInfoPlugin().iosInfo.then((info) {
        setState(() => productName = info.utsname.productName);
      });
    } else if (Platform.isMacOS) {
      DeviceInfoPlugin().macOsInfo.then((info) {
        setState(() => productName = info.productName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apple Product Name'),
        ),
        body: Center(
          child: Text(
            productName ?? 'loading...',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
