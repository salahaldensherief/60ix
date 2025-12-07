// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
//
// import 'package:sixty_ix/modules/core/networking/error_response.dart';
//
// import 'package:sixty_ix/modules/core/payment_services/entities/payment_request_entity.dart';
//
// import 'package:sixty_ix/modules/core/payment_services/entities/payment_response_entity.dart';
//
// import '../../../community/presentation/create_post/create_post_exports.dart';
// import '../payment_services.dart';
//
// // class PayPalPaymentService implements PaymentServices {
// //   @override
// //   Future<Either<BasicFailure, PaymentResponseEntity>> pay({required PaymentRequestEntity paymentRequestEntity}) {
// //    try {
// //       final res =
// //    }catch(e,s) {}
// //   }
// // }
//
// class PayPalPaymentService {
//   void pay(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) => PaypalCheckoutView(
//           sandboxMode: true,
//           clientId:
//               "AbdwpZ6e3YTHjdoz2lUf7I3dybSbrKWYDoLCBAHUUocU7P7lxDXUeCpioUjDQ5iMn2rPINTAP8UUgRTH",
//           secretKey:
//               "ECS1KS6jpnJu8fMI6B36AYGfYZ4D6RoUtGT0sAoi1ZNRDVprBujw696RNWV5QtMPHxwU8ylh0VT3sjBm",
//           transactions: const [
//             {
//               "amount": {
//                 "total": '70',
//                 "currency": "EUR",
//                 "details": {
//                   "subtotal": '70',
//                   "shipping": '0',
//                   "shipping_discount": 0,
//                 },
//               },
//               "description": "The payment transaction description.",
//               // "payment_options": {
//               //   "allowed_payment_method":
//               //       "INSTANT_FUNDING_SOURCE"
//               // },
//               "item_list": {
//                 "items": [
//                   {
//                     "name": "Apple",
//                     "quantity": 4,
//                     "price": '5',
//                     "currency": "EUR",
//                   },
//                   {
//                     "name": "Pineapple",
//                     "quantity": 5,
//                     "price": '10',
//                     "currency": "EUR",
//                   },
//                 ],
//               },
//             },
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (Map params) async {
//             print("onSuccess: $params");
//           },
//           onError: (error) {
//             print("onError: $error");
//             Navigator.pop(context);
//           },
//           onCancel: () {
//             print('cancelled:');
//           },
//         ),
//       ),
//     );
//   }
// }
