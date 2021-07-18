import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  print('Generating...');

  final urls = [
    // iPhone, iPod, iPad, Apple Watch
    'https://raw.githubusercontent.com/fieldnotescommunities/ios-device-identifiers/master/ios-device-identifiers.json',
    // iMac, MacBook, MacBook Air, MacBook Pro, Mac mini, Mac Pro
    'https://raw.githubusercontent.com/kyle-seongwoo-jun/mac-device-identifiers/main/mac-device-identifiers-unique.json',
  ];

  final responses =
      await Future.wait(urls.map((url) => http.get(Uri.parse(url))));
  if (responses.any((response) => response.statusCode != 200)) {
    print('Request failed');
    return;
  }

  final map = responses
      .map((response) => json.decode(response.body) as Map<String, dynamic>)
      .fold<Map<String, dynamic>>({}, (a, b) => a..addAll(b));

  final sb = StringBuffer();
  sb.writeln("part of 'apple_product_name.dart';");
  sb.writeln('');
  sb.writeln('const _map = ${json.encode(map)};');
  sb.writeln('');
  sb.writeln('String? _lookup(String machineId) => _map[machineId];');
  sb.writeln('');

  final sourcePath = '../lib/apple_product_name.g.dart';
  await File(sourcePath).writeAsString(sb.toString());
  await Process.run('flutter', ['format', sourcePath]);

  print('Generated.');
}
