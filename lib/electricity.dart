import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'reusable/reusable.dart';

class electripage extends StatefulWidget {
  String s;
  electripage(  {super.key,required String this.s});

  @override
  State<electripage> createState() => _electripageState();
}

class _electripageState extends State<electripage> {double _progress=0;
late InAppWebViewController webview;
GlobalKey<ScaffoldState> Scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Scaffoldkey,
        appBar: AppBar(
          backgroundColor: theme.themebackground,
        ),
        body: Stack(
          children: [

            InAppWebView(
              initialUrlRequest: URLRequest(
                url:Uri.parse(widget.s),


              ),
              onWebViewCreated: (InAppWebViewController controller){
                webview=controller;
              },
              // onLoadStart: (controller, url) {
              //
              //   String modifiedUrl = '$url?userId=${_auth.currentUser?.uid}';
              //  webview?.loadUrl( urlRequest: URLRequest(url:Uri.parse(modifiedUrl), ) );
              // },
              onProgressChanged: (InAppWebViewController controller,int progress){
                setState(() {
                  _progress=progress/100;
                });
              },
            ),
            _progress<1?SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  value:_progress,
                )
            ):SizedBox()
          ],
        )
    );
  }
}
