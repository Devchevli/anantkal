// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefService {
//   static SharedPreferences? _pref;

//   static Future init() async {
//     _pref = await SharedPreferences.getInstance();
//   }

//   static _ensureInitialized() {
//     if (_pref == null) {
//       throw StateError('Shared preference is not initialized');
//     }
//   }

//   static String? getSessionToken() {
//     _ensureInitialized();
//     return _pref?.getString('sessionToken');
//   }


//   static String? getSubscriptionUrl() {
//     _ensureInitialized();
//     return _pref?.getString('subscriptionUrl');
//   }

//   static Future storeUserId(String subscriptionUrl) async {
//     await _pref?.setString('subscriptionUrl', subscriptionUrl);
//   }

//   // static Future storeNotificationPerform(int value) async {
//   //   await _pref?.setInt('intValue', value);
//   // }

//   // static int? getnotificationPerform() {
//   //   _ensureInitialized();
//   //   return _pref?.getInt('intValue');
// }