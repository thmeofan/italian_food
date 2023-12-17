import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppWebView extends StatelessWidget {
  final String url;

  MyInAppWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In-App WebView'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}
