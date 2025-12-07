part of 'app_error_tracking_handler.dart';

class _FirebaseCrashlyticsHelper {
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  static Future<void> init() async {
    if (!kReleaseMode) return;
    FlutterError.onError = _handleFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void log(String message) {
    _crashlytics.log(message);
  }

  static Future<void> setUserId(String userId) async {
    await _crashlytics.setUserIdentifier(userId);
  }

  static Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    bool fatal = false,
  }) async {
    if (!kReleaseMode) return;
    await _crashlytics.recordError(exception, stack, fatal: fatal);
    _crashlytics.sendUnsentReports();
  }

  static void _handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    _crashlytics.recordFlutterFatalError(details);
  }

  static Future<String> recordServerError(Response response) async {
    if (!kReleaseMode) return '';

    final request = response.requestOptions;
    final statusCode = response.statusCode ?? 0;
    final errorMessage =
        response.data?['message'] ??
        response.data?['error'] ??
        'Unknown server error';

    final crashLog = '''
🔥 SERVER ERROR 🔥
Method: ${request.method}
URL: ${request.uri}
Status Code: $statusCode
Headers: ${request.headers}
Request Body: ${request.data}
Response: ${response.data}
''';

    log("Server error detected. Status: $statusCode");
    log(crashLog);

    await recordError(
      Exception("HTTP $statusCode: $errorMessage"),
      StackTrace.current,
    );

    return crashLog;
  }
}
