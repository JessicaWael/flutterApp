// ignore_for_file: sort_child_properties_last

import 'dart:async';

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/login/view/login_screen.dart';
import 'package:app/src/feature/payment/view/payment_screen.dart';
import 'package:app/src/feature/subscription/view/widget/card_widget_subscribtion.dart';
import 'package:app/src/feature/subscription/view_model/subscription_view_model.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../data/model/dataclass/data_class.dart';
import '../../../../utils/app_color.dart';
import 'chart_screen.dart';

class MarketsScreen extends StatefulWidget {
  late List<MarketModel> visibleMarkets;

   MarketsScreen({super.key,  required this.visibleMarkets});

  @override
  _MarketsScreenState createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    late final PlatformWebViewControllerCreationParams params;


    // TODO: implement initState
    super.initState();
    params = const PlatformWebViewControllerCreationParams();

    WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            _onAddToJs(controller);
            setState(() {
            });
          },
          onPageStarted: (String url) {

            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {

            // debugPrint('Page finished loading: $url');
            // _onAddToJs(controller);
            // setState(() {
            // });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.tradingview.com/symbols/EGX-EGX30/components/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            _onAddToJs(controller);
            setState(() {
            });
            debugPrint('url change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
          },
        ),
      )..setOnScrollPositionChange((change) {

      _onAddToJs(controller);
      setState(() {
      });
    })
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://www.tradingview.com/symbols/EGX-EGX30/components/'));



    _controller = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EGX 30',style: TextStyle(color: Colors.white),),
      ),
      body:  Column(
        children: [
          Row(children: [
            Expanded(
              child: TextButton(onPressed: () async {
                // await Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) =>
                //           MarketsScreen(visibleMarkets: []),
                //     ));
              }, child: Text('General'),
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white
                ),),
            ),
            Expanded(
              child: TextButton(onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChartScreen(visibleMarkets: []),
                    ));
              }, child: Text('Charts'),
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white
                  )),
            )

          ],),
          Expanded(
            child: WebViewWidget(controller: _controller,
            
            ),
          ),
        ],
      ),
    );
  }
  _onAddToJs(webViewController) {
    webViewController.runJavaScript('''
     document.querySelectorAll('.js-sticky-symbol-header-container').forEach(function(a){
a.remove()
})  
 document.querySelectorAll('.tv-header').forEach(function(a){
a.remove()
})
 document.querySelectorAll('.symbolRow-OJZRoKx6').forEach(function(a){
a.remove()
})
 document.querySelectorAll('.tv-react-category-header').forEach(function(a){
a.remove()
})
 document.querySelectorAll('.panel-L5As7uOz').forEach(function(a){
a.remove()
})
 document.querySelectorAll('.descriptionPanel-L5As7uOz').forEach(function(a){
a.remove()
})
document.addEventListener(
  'click',
  (e) => {
    if (e.target.closest('.row-RdUXZpkv')) {
      e.stopPropagation();
    }
  },
  true // attach in capturing phase
);
    var footer = document.getElementsByTagName('footer')[0]
      footer.parentNode.removeChild(footer)
  
   
      console.log('fffffff')
    '''
    );
  }

}