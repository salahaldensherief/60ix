class UserModel {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String mobileCode;
  final String createdAt;
  final String updatedAt;
  final String accessToken;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken, required this.mobileCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phone: json['mobile_number'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      accessToken: json['token'] ?? '',
      mobileCode: json['mobile_code']?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'email': email,
      'name': name,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'accessToken': accessToken,
      'mobile_code': mobileCode,
    };
  }
}
