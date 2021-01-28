/// This constants are deliberately put into a file different from
/// `test_factory.dart` so that they are in a file without any Flutter
/// dependencies and can be imported in driver test files.

class TestName {
  static const String platformAndAblyVersion = 'platformAndAblyVersion';
  static const String appKeyProvisioning = 'appKeyProvisioning';

  static const String testHelperFlutterErrorTest = 'testHelperFlutterErrorTest';
  static const String testHelperUnhandledExceptionTest =
      'testHelperUnhandledExceptionTest';

  static const String restPublish = 'restPublish';
  static const String restHistory = 'restHistory';
  static const String restPublishWithAuthCallback =
      'restPublishWithAuthCallback';
  // TODO(tiholic) handle restHistoryWithAuthCallback
  static const String restPresenceGet = 'restPresenceGet';
  static const String restPresenceHistory = 'restPresenceHistory';

  static const String realtimePublish = 'realtimePublish';
  static const String realtimeEvents = 'realtimeEvents';
  static const String realtimeSubscribe = 'realtimeSubscribe';
  static const String realtimeHistory = 'realtimeHistory';
  static const String realtimePublishWithAuthCallback =
      'realtimePublishWithAuthCallback';
  // TODO(tiholic) handle realtimeHistoryWithAuthCallback
}
