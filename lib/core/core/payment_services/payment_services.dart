import 'package:dartz/dartz.dart';

import '../networking/error_response.dart';
import 'entities/payment_request_entity.dart';
import 'entities/payment_response_entity.dart';

abstract class PaymentServices {
  Future<Either<BasicFailure, PaymentResponseEntity>> pay({
    required PaymentRequestEntity paymentRequestEntity,
  });
}
