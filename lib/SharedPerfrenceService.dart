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


///////////////// UI /////////////////////////////

// Container(
//   width: 360,
//   child: Row(
//     children: [
//       Text("Dev"),
//       Spacer(),
//       Text("10:22 am"),
//     ],
//   ),
// ),
// Container(
//   width: 360,
//   decoration: const BoxDecoration(
//       color: Colors.grey,
//       borderRadius: BorderRadius.only(
//           topRight: Radius.circular(16),
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16))),
//   child: const Padding(
//     padding:
//     EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
//     child: Text(
//       "xyzzz",
//       style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//     ),
//   ),
// ),
// SizedBox(
//   height: 20,
// ),
// Container(
//   width: 360,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       Text("Dev"),
//       Spacer(),
//       Text("10:22 am"),
//     ],
//   ),
// ),
// Container(
//   width: 360,
//   decoration: const BoxDecoration(
//       color: Colors.grey,
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16))),
//   child: const Padding(
//     padding:
//     EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
//     child: Text(
//       "xyzzz",
//       style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//     ),
//   ),
// ),
// SizedBox(
//   height: 200,
// ),
// Container(
//   height: 90,
//   color: Colors.grey,
//   child: Padding(
//     padding: const EdgeInsets.all(20),
//     child: Container(
//       height: 20,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.yellow,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 14),
//             child: Icon(CupertinoIcons.smiley),
//           ),
//           Spacer(),
//           Text("Enter Meassage"),
//           Spacer(),
//           Padding(
//             padding: EdgeInsets.only(right: 14),
//             child: Icon(Icons.image),
//           ),
//           Container(
//             child: Icon(Icons.telegram),
//             width: 50,
//             color: Colors.blueAccent,
//           ),
//         ],
//       ),
//     ),
//   ),
// ),