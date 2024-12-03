
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationHandler {
  void onNotificationTap({NotificationResponse? data});

  void onNotificationBackgroundTap({RemoteMessage? data});
}

class NotificationHandlerImpl extends NotificationHandler {
  NotificationHandlerImpl._();

  static final NotificationHandlerImpl _instance = NotificationHandlerImpl._();

  static NotificationHandlerImpl get instance => _instance;

  @override
  Future<void> onNotificationTap({NotificationResponse? data}) async {
    Logger.write('Notification Click : ---------- ${data?.payload}');
    Map<String, dynamic> payload = jsonDecode(data?.payload ?? '');
    await _onTapNotification(payload);
  }

  @override
  Future<void> onNotificationBackgroundTap({RemoteMessage? data}) async {
    Logger.write('Notification Click : ---------- ${data?.toMap().toString()}');
    Map<String, dynamic> payload = data?.toMap() ?? {};
    await _onTapNotification(payload);
  }

  Future<void> _onTapNotification(payload) async {
    bool hasData = payload.containsKey('data');
    if(hasData){
      String type = payload['data']['type'];
      if(type == 'order'){
        // Get.toNamed(Routes.YOUR_ORDER_VIEW);
      }
      else if(type == 'general'){

      }
      else if(type == 'order_update'){

      }
      else if(type == 'delivered'){

      }
      else if(type == 'return_reject'){

      }
    }
  }
}
