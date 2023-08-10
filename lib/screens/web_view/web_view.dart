import 'package:e_plaza/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/app_bar.dart';

class WebViewScreen extends StatefulWidget {
  final String? title;
  final String url;

  WebViewScreen(this.url, {this.title});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) => NavigationDecision.navigate,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           MyAppBar(title ?? 'termsAndCondition'.t),
  //           Expanded(child: WebView(initialUrl: url, javascriptMode: JavascriptMode.unrestricted)),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MyAppBar(widget.title ?? 'termsAndCondition'.t),
            // Expanded(child: WebView(initialUrl: url, javascriptMode: JavascriptMode.unrestricted)),
            Expanded(
              child: WebViewWidget(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
