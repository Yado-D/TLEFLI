import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  // final Function onfinish;
  // const PaypalPayment({super.key, required this.onfinish});

  const PaypalPayment({super.key});

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  // var checkoutUrl;
  // var executeUrl;
  // var accessToken;

  // ApiService services = ApiService();

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () async {
  //     try {
  //       accessToken = await services.GetAccessToken(clientId, secretId);
  //       final res = await services.createPaypalPayment(map, accessToken);
  //       if (res != null) {
  //         setState(() {
  //           checkoutUrl = res['approvalUrl'];
  //           executeUrl = res['executeUrl'];
  //         });
  //       }
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //   });

  //   super.initState();
  // }

  // Map<String, dynamic> map() {
  //   return {
  //     "currency": "USD",
  //     "total": 567,
  //     "shipping": "empty",
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    // print(checkoutUrl);
    // if (checkoutUrl != null) {
    //   return Scaffold(
    //     appBar: SimpleAppBars(context, 'Paypal Method'),
    //     body: WebView(
    //       initialUrl: checkoutUrl,
    //       javascriptMode: JavaScriptMode.unrestricted,
    //       navigationDelegate: (NavigationRequest request) {
    //         if(request.url.contains(returnUrl)){}
    //       },
    //     ),
    //   );
    // }
    return Scaffold(
      appBar: SimpleAppBars(context, 'Paypal Method'),
      body: Center(
        child: ReusableText(
          TextString: 'Error',
          FontSize: 19,
        ),
      ),
    );
  }
}
