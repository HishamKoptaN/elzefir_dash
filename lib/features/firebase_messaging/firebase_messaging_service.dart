// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:injectable/injectable.dart';
// import '../../config/env_config.dart';
// import '../../core/di/dependency_injection.dart';
// import '../../core/services/device_service.dart';
// import '../notifications/domain/entities/notification_entity.dart';
// import '../notifications/domain/repo/notifications_repo.dart';

// @LazySingleton()
// class FirebaseMessagingService {
//   static Future<void> initialize() async {
//     if (DeviceService.isDesktopPlatform()) {
//       return;
//     }
//     FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
//       saveNotif(message);
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//       saveNotif(message);
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       saveNotif(message);
//     });
//     await _requestPermission();
//     try {
//       String? token = await getFcmToken();
//       log("Firebase Token: $token");
//     } catch (e) {
//       log("Error subscribing to topic: $e");
//     }
//   }

//   static Future<void> _requestPermission() async {
//     if (DeviceService.isDesktopPlatform()) {
//       return;
//     }
//     final settings = await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     switch (settings.authorizationStatus) {
//       case AuthorizationStatus.authorized:
//         break;
//       case AuthorizationStatus.provisional:
//         break;
//       case AuthorizationStatus.denied:
//         break;
//       case AuthorizationStatus.notDetermined:
//         break;
//     }
//   }

//   static Future<String?> getFcmToken() async {
//     if (DeviceService.isDesktopPlatform()) return null;
//     if (DeviceService.isWebPlatform()) {
//       try {
//         final messaging = FirebaseMessaging.instance;
//         final token = await messaging.getToken(
//           vapidKey: EnvConfig.config.vapidKey,
//         );
//         return token ?? '';
//       } catch (e) {
//         return e.toString();
//       }
//     }
//     try {
//       final token = await FirebaseMessaging.instance.getToken();
//       if (token != null) {
//         return token;
//       } else {
//         return 'no_fcm_token_available';
//       }
//     } catch (e) {
//       return 'fcm_token_error';
//     }
//   }

//   static void handleDeepLink(Map<String, dynamic> data) {
//     final String? route = data['route'];
//     if (route != null && route.isNotEmpty) {}
//   }

//   Stream<String> get onTokenRefresh {
//     return FirebaseMessaging.instance.onTokenRefresh;
//   }

//   static void saveNotif(RemoteMessage message) async {
//     try {
//       await getIt<NotificationsRepo>().saveNotification(
//         notification: NotificationEntity(
//           id: message.data['id']!,
//           title: message.data['title']!,
//           body: message.data['body']!,
//           // data: Map<String, String>.from(message.data),
//           // type: NotificationType.fromString(type: message.data['type'] ?? ''),
//           read: false,
//           createdAt: DateTime.now().toIso8601String(),
//         ),
//       );
//     } catch (e) {
//       log("Error saving notification: $e");
//     }
//   }
// }
