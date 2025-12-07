class PaymentRequestEntity {
  final String? amount;
  final String? currency;
  final String? paymentMethod;
  final String? description;
  final String? returnURL;
  final String? cancelURL;

  PaymentRequestEntity({
    this.amount,
    this.currency,
    this.paymentMethod,
    this.description,
    this.returnURL,
    this.cancelURL,
  });
}
