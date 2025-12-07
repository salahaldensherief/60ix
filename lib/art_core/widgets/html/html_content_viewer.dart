import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlContentViewer extends StatelessWidget {
  final String html;

  const HtmlContentViewer({super.key, required this.html});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      renderMode: RenderMode.column,
      buildAsync: true,
      enableCaching: true,
    );
  }
}
