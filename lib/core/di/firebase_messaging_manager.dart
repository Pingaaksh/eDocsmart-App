import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:skin_match/core/di/notification_handler.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'jobalots_channel_id',
  'jobalots_channel_name',
  description: 'This channel is used to send notification to all users.',
  importance: Importance.high,
);
var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
  presentBadge: true,
  presentAlert: true,
  presentSound: true,
  interruptionLevel: InterruptionLevel.active,
);
var androidNotificationDetails = AndroidNotificationDetails(
  channel.id,
  channel.name,
  channelDescription: channel.description,
  icon: '@mipmap/ic_launcher',
  priority: Priority.high,
);
var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  Logger.write('@108 Notification Tap Background ${response.toString()}');
  NotificationHandlerImpl.instance.onNotificationBackgroundTap(
    data: RemoteMessage(data: jsonDecode(response.payload ?? '')),
  );
}

class FirebaseMessagingManager {
  FirebaseMessagingManager._privateConstructor();

  static final FirebaseMessagingManager _instance =
      FirebaseMessagingManager._privateConstructor();

  static FirebaseMessagingManager get instance => _instance;

  FirebaseMessaging get firebaseMessage => FirebaseMessaging.instance;

  Future<void> init() async {
    try {
      checkNotificationPermission();
      await firebaseMessage.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      getToken();
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
      FirebaseMessaging.onMessage.listen(notificationMessageHandler);
    } catch (error) {
      Logger.write('Firebase Initialisation Error : $error');
    }
  }

  Future<String?> getToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      Logger.write('Firebase Token: $token');
      return token;
    } catch (error) {
      Logger.write(error.toString());
      return 'N/A';
    }
  }

  void notificationMessageHandler(RemoteMessage message) async {
    Logger.write(
      'Message: ${jsonEncode(message.data)} or ${message.notification?.title} and ${message.notification?.body}',
    );
    // {"order_detail_id":"","order_number":"","body":"Your order (#1565) has been placed successfully.","type":"order","title":"Order Placed!"} or Order Placed! and Your order (#1565) has been placed successfully.. isError: [false]
    RemoteNotification? notification = RemoteNotification.fromMap(
      (message.notification?.toMap()) ?? {},
    );
    showNotificationWithDefaultSound(
      notification.hashCode.toString(),
      notification.title,
      notification.body,
      message.toMap(),
    );
  }

  Future<void> showNotificationWithDefaultSound(
    String? id,
    String? title,
    String? body,
    Map notification,
  ) async {
    Logger.write('Title : $title Body : $body');

    var iosInitializationSettings = DarwinInitializationSettings(
      // onDidReceiveLocalNotification:
      //     (int id, String? title, String? body, String? payload) {
      //   Logger.write('@108 we got $body and $payload');
      // },
    );

    if (Platform.isAndroid) {
      BigPictureStyleInformation? bigPictureStyleInformation;
      String imageURL =
          (notification['notification']['android']['imageUrl'] ?? '');

      if (imageURL.isNotEmpty) {
        bigPictureStyleInformation = await getBigPictureStyle(imageURL);
      }

      flutterLocalNotificationsPlugin
          .show(
        int.parse(id ?? '0'),
        title,
        body,
        NotificationDetails(
          iOS: iOSPlatformChannelSpecifics,
          android: imageURL.isNotEmpty
              ? AndroidNotificationDetails(
                  androidNotificationDetails.channelId,
                  androidNotificationDetails.channelName,
                  color: androidNotificationDetails.color,
                  icon: androidNotificationDetails.icon,
                  styleInformation: bigPictureStyleInformation,
                )
              : androidNotificationDetails,
        ),
        payload: jsonEncode(notification),
      )
          .catchError((error) {
        Logger.write('Error: $error');
      });
    }

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: openNotificationScreen,
    );
  }

  Future<void> checkNotificationPermission() async {
    NotificationSettings settings = await firebaseMessage.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Logger.write('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Logger.write('User granted provisional permission');
    } else {
      Logger.write('User declined or has not accepted permission');
    }
  }
}
@pragma('vm:entry-point')
void openNotificationScreen(NotificationResponse response) {
  Logger.write('@108 Open Notification Detail Screen${response.toString()}');
  NotificationHandlerImpl.instance.onNotificationTap(data: response);
}

@pragma('vm:entry-point')
void openNotificationFromBackGround(RemoteMessage? data) {
  Logger.write('@108 :::: ${data?.toMap().toString()}');
  NotificationHandlerImpl.instance.onNotificationBackgroundTap(data: data);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  FirebaseMessagingManager.instance.init();
  NotificationHandlerImpl.instance.onNotificationBackgroundTap(data: message);
}
