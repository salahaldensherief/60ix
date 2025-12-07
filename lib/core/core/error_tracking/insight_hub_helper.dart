part of 'app_error_tracking_handler.dart';

class _InsightHubHelper {
  static Future<void> init() async {
    await bugsnag.start(apiKey: 'd66a4cde1100b5bbcda5dc0779bfe3aa');

    FlutterError.onError = _handleFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      notifyError(error, stackTrace: stack);
      return true;
    };
  }

  static void _handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    notifyError(details);
  }

  static void notifyError(dynamic error, {StackTrace? stackTrace}) {
    bugsnag.notify(error, stackTrace);
  }

  static void logBreadcrumb(String message) {
    bugsnag.leaveBreadcrumb(message);
  }

  static void setUser({required String id, String? email, String? name}) {
    bugsnag.setUser(id: id, email: email, name: name);
  }

  static void addMetadata(String section, Map<String, Object> data) {
    bugsnag.addMetadata(section, data);
  }
}
