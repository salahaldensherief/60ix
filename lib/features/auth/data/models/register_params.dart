class RegisterParams {
  final String name;
  final String mobileCode;
  final String mobileNumber;
  final String email;
  final int gender;
  final String birthDate;
  final int cityId;
  final String? password;
  final String? confirmedPassword;

  RegisterParams({
    required this.name,
    required this.mobileCode,
    required this.mobileNumber,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.cityId,  this.password,  this.confirmedPassword,

  });

  Map<String, dynamic> toJson() {
    return {
      "name": {
        "en": name,
      },
      "mobile_code": mobileCode,
      "mobile_number": mobileNumber,
      "email": email,
      "gender": gender,
      "birth_date": birthDate,
      "city_id": cityId,
      "password":password,
      "password_confirmation":confirmedPassword

    };
  }
}
