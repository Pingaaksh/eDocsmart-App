import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     FirebaseApp.configure()

    GeneratedPluginRegistrant.register(with: self)
//     if #available(iOS 10.0, *) {
//             // For iOS 10 display notification (sent via APNS)
//             UNUserNotificationCenter.current().delegate = self
//             let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//             UNUserNotificationCenter.current().requestAuthorization(
//                     options: authOptions,
//                     completionHandler: {_, _ in })
//         } else {
//             let settings: UIUserNotificationSettings =
//             UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//             application.registerUserNotificationSettings(settings)
//         }
//         application.registerForRemoteNotifications()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
//
//    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//
//          // Pass device token to messaging
//          Messaging.messaging().apnsToken = deviceToken
//          return super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
//      }
//
//      override func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any],
//          fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//
//          // Handle it for firebase messaging analytics
//          if ((notification["gcm.message_id"]) != nil) {
//              Messaging.messaging().appDidReceiveMessage(notification)
//          }
//          return super.application(application, didReceiveRemoteNotification: notification, fetchCompletionHandler: completionHandler)
//      }
    
}
