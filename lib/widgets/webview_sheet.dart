import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

final Set<Factory> gestureRecognizers = [Factory(() => EagerGestureRecognizer())].toSet();

class WebViewSheet extends StatelessWidget {
  WebViewSheet({Key key, this.pageUrl: '', this.title: ''}) : super(key: key);

  final String pageUrl;
  final String title;

  UniqueKey _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return WebView(
          key: _key,
          initialUrl: this.pageUrl,
          javascriptMode: JavascriptMode.unrestricted,
          gestureRecognizers: gestureRecognizers,
          // onWebViewCreated: (controller) {
          // },
          // onWebViewCreated: (WebViewController webViewController) {
          //   _controller.complete(webViewController);
          // },
          // onProgress: (int progress) {
          //   print("WebView is loading (progress : $progress%)");
          // },
          // javascriptChannels: <JavascriptChannel>{
          //   _toasterJavascriptChannel(context),
          // },
          // navigationDelegate: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     print('blocking navigation to $request}');
          //     return NavigationDecision.prevent;
          //   }
          //   print('allowing navigation to $request');
          //   return NavigationDecision.navigate;
          // },
          // onPageStarted: (String url) {
          //   print('Page started loading: $url');
          // },
          // onPageFinished: (String url) {
          //   print('Page finished loading: $url');
          // },
          // gestureNavigationEnabled: true,
        );
      }),
      // floatingActionButton: favoriteButton(),
    );
  }
}
