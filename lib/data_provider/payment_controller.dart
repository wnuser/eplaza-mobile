import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../modals/user.dart';
import '../utils/const.dart';
import '../utils/logger.dart';
import '../utils/preference.dart';

typedef PaymentSuccess = Function(
    String paymentMethod, String paymentId, double totalPrice, Map<String, dynamic>? response);
typedef PaymentError = Function(String paymentMethod, String error, double totalPrice);

class PaymentController {
  late Razorpay _razorpay;

  late PaymentSuccess onSuccess;
  late PaymentError onError;
  late double price;
  String description = '';
  String planId = '';

  Map<String, dynamic>? options;

  void pay({
    required double price,
    required PaymentSuccess onSuccess,
    required PaymentError onError,
    String description = '',
  }) async {
    this.onSuccess = onSuccess;
    this.onError = onError;
    this.price = price;
    this.description = description;

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    _payWithRazorpay();
  }

  void _payWithRazorpay() async {
    User user = Preference.user;

    options = {
      'key': Const.RAZOR_PAY_KEY,
      'amount': (price * 100).toInt(),
      'name': user.firstName,
      'currency': "INR",
      // 'image': '',
      'description': description,
      'prefill': {
        'name': user.firstName,
        'contact': user.mobile,
        'email': user.email,
      },
      'notes': {
        'address': '',
      },
      'theme': {
        'color': '#F3471C',
      },
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };

    try {
      _razorpay.open(options!);
    } catch (e) {
      Logger.ex(tag: 'PAYMENT', value: e);
      onError.call(PaymentMethod.RAZOR_PAY, e.toString(), price);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Logger.m(tag: 'PAYMENT ID', value: response.paymentId);

    options?.putIfAbsent(
        'transaction',
        () => {
              'razorpay_payment_id': response.paymentId.nullSafe,
              'razorpay_signature': response.signature.nullSafe,
              'razorpay_order_id': response.orderId.nullSafe,
            });

    onSuccess.call(PaymentMethod.RAZOR_PAY, response.paymentId.nullSafe, price, options);
    _razorpay.clear();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.message);
    onError.call(PaymentMethod.RAZOR_PAY, response.message.nullSafe, price);
    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}
}
