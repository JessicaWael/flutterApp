import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/data_card/view/data_card_screen.dart';
import 'package:app/src/feature/payment/view/widget/card_widget_payment.dart';
import 'package:app/src/feature/payment/view_model/payment_view_model.dart';
import 'package:app/src/utils/app_color.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../auth/register/repository/auth_repository.dart';
import '../../init_home/view/init_home_screen.dart';
import 'PaymentwWthCard.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = 'PaymentScreen';
  int? type;
  PaymentScreen({ this.type});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentViewModel viewModel = PaymentViewModel();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaymentViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/credit_card.png',
                  height: 150.h,
                  width: 150.w,
                  fit: BoxFit.fill,
                ),
                Text(
                  S.of(context).PAYMENT_METHOD,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Gap(30.h),
                CardWidgetPayment(
                  svgPicture: 'assets/images/Visa.svg',
                  value: viewModel.visa,
                  groupValue: viewModel.selectRadio!,
                  onChanged: (value) {
                    viewModel.selectRadio = value;
                    setState(() {});
                  },
                ),
                Gap(25.h),
                CardWidgetPayment(
                  svgPicture: 'assets/images/Mastercard.svg',
                  value: viewModel.masterCard,
                  groupValue: viewModel.selectRadio!,
                  onChanged: (value) {
                    viewModel.selectRadio = value;
                    setState(() {});
                  },
                ),
                Gap(25.h),
                CardWidgetPayment(
                  svgPicture: 'assets/images/PayPal.svg',
                  value: viewModel.payPal,
                  groupValue: viewModel.selectRadio!,
                  onChanged: (value) {
                    viewModel.selectRadio = value;
                    setState(() {});
                  },
                ),
                Gap(130.h),
                CustomButton(
                  onPressed: () {
                   if (viewModel.selectRadio == 'payPal') {
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder: (BuildContext context) =>
                             UsePaypal(
                                 sandboxMode: true,
                                 clientId:
                                 "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                                 secretKey:
                                 "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                                 returnURL: "https://samplesite.com/return",
                                 cancelURL: "https://samplesite.com/cancel",
                                 transactions: const [
                                   {
                                     "amount": {
                                       "total": '10.12',
                                       "currency": "USD",
                                       "details": {
                                         "subtotal": '10.12',
                                         "shipping": '0',
                                         "shipping_discount": 0
                                       }
                                     },
                                     "description":
                                     "The payment transaction description.",
                                     // "payment_options": {
                                     //   "allowed_payment_method":
                                     //       "INSTANT_FUNDING_SOURCE"
                                     // },
                                     "item_list": {
                                       "items": [
                                       ],


                                     }
                                   }
                                 ],
                                 note: "Contact us for any questions on your order.",
                                 onSuccess: (Map params) async {
                                   sharedpref!.setInt("subscribe", 1);
                                    await AuthRepository().subscribeUser(widget.type);
                                   Navigator.of(context)
                                       .pushNamed(InitHomeScreen.routeName);


                                   print("onSuccess: $params");
                                 },
                                 onError: (error) {
                                   print("onError: $error");
                                 },
                                 onCancel: (params) {
                                   print('cancelled: $params');
                                 }),
                       ),
                     );
                     //      (viewModel.selectRadio) == 'payPal' ?
                   }else{
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) =>
                                 PaymentwWthCard(type:widget.type)));


                   }},
                  title: S.of(context).CONTINUE,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
