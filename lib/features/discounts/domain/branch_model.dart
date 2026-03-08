class BranchModel {
  final String name;
  final String address;
  final double price;
  final bool isRecommended;
  final String phone;

  const BranchModel({
    required this.name,
    required this.address,
    required this.price,
    this.isRecommended = false,
    required this.phone,
  });
}