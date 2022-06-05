// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:bookhubuz/base/base_functions.dart';
// import 'package:bookhubuz/core/constants/app_keys.dart';

// class LocalSource {
//   LocalSource._();

//   static Box? _localStorage;

//   static LocalSource? _localSource;

//   static LocalSource get instance => _localSource ?? LocalSource._();

//   static Future<void> getInstance() async {
//     if (_localStorage == null) {
//       _localSource ??= LocalSource._();
//       _localStorage = await Hive.openBox(AppKeys.localSource);
//     }
//   }

//   Future<void> removeProfile() async {
//     await _localStorage?.delete(AppKeys.hasProfile);
//     await _localStorage?.delete(AppKeys.customerId);
//     await _localStorage?.delete(AppKeys.name);
//     await _localStorage?.delete(AppKeys.locale);
//     await _localStorage?.delete(AppKeys.phone);
//     await _localStorage?.delete(AppKeys.accessToken);
//     await _localStorage?.delete(AppKeys.refreshToken);
//   }

//   bool hasProfile() {
//     return _localStorage?.get(AppKeys.hasProfile, defaultValue: false) ?? false;
//   }

//   String getAccessToken() {
//     return _localStorage?.get(AppKeys.accessToken, defaultValue: "") ?? '';
//   }

//   String getLocale() {
//     return _localStorage?.get(
//       AppKeys.locale,
//       defaultValue: BaseFunctions.getDefaultLocale(),
//     );
//   }

//   String getRefreshToken() {
//     return _localStorage?.get(AppKeys.refreshToken, defaultValue: "") ?? '';
//   }

//   String getFcmToken() {
//     return _localStorage?.get(AppKeys.fcmToken, defaultValue: "") ?? '';
//   }

//   Future<void> setRefreshedTokens({
//     required String? refreshToken,
//     required String? accessToken,
//   }) async {
//     await _localStorage?.put(AppKeys.refreshToken, refreshToken ?? '');
//     await _localStorage?.put(AppKeys.accessToken, accessToken ?? '');
//   }
// }
