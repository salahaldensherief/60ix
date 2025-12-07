part of 'app_error_tracking_handler.dart';

class _SendNotificationSlackHelper {
  final Dio _dio = Dio();

  Future<void> sendSlackMessage(String message) async {
    if (!kReleaseMode) return;

    const slackWebhookUrl =
        'https://hooks.slack.com/services/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';

    try {
      final response = await _dio.post(
        slackWebhookUrl,
        data: {'text': message},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        // Success
      } else {
        print('Slack responded with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending Slack message: $e');
    }
  }
}
