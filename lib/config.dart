import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  static AppConfig? _instance;
  final FirebasePlatformConfig iosConfig;
  final FirebasePlatformConfig androidConfig;
  final FirebasePlatformConfig webConfig;
  final FirebasePlatformConfig macosConfig;
  final FirebasePlatformConfig windowsConfig;

  AppConfig._internal({
    required this.iosConfig,
    required this.androidConfig,
    required this.webConfig,
    required this.macosConfig,
    required this.windowsConfig,
  });

  static Future<AppConfig> init() async {
    String fileName = 'config';
    if (_instance == null) {
      final configString =
      await rootBundle.loadString('assets/$fileName.json');
      final configData = json.decode(configString);

      _instance = AppConfig._internal(
        iosConfig: FirebasePlatformConfig.fromJson(configData['ios']),
        androidConfig: FirebasePlatformConfig.fromJson(configData['android']),
        webConfig: FirebasePlatformConfig.fromJson(configData['web']),
        macosConfig: FirebasePlatformConfig.fromJson(configData['macos']),
        windowsConfig: FirebasePlatformConfig.fromJson(configData['windows']),
      );
    }
    return _instance!;
  }

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception("AppConfig not initialized. Call forEnvironment first.");
    }
    return _instance!;
  }
}


class FirebasePlatformConfig {
  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  final String storageBucket;
  final String? iosBundleId;
  final String? authDomain;

  FirebasePlatformConfig({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
    this.iosBundleId,
    this.authDomain,
  });

  static FirebasePlatformConfig fromJson(Map<String, dynamic> json) {
    return FirebasePlatformConfig(
      apiKey: json['apiKey'],
      appId: json['appId'],
      messagingSenderId: json['messagingSenderId'],
      projectId: json['projectId'],
      storageBucket: json['storageBucket'],
      iosBundleId: json['iosBundleId'],
      authDomain: json['authDomain'],
    );
  }
}