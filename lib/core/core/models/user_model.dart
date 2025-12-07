import 'package:sixty_ix/modules/shared/data/models/countries_and_cities_model.dart';
import 'package:sixty_ix/modules/shared/data/models/models.dart';

import '../../shared/data/models/active_countries/active_country_model.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? mobileCode;
  final String? mobileNumber;
  final String? mobile;
  final String? birthDate;
  final int? type;
  final bool? isVerified;
  final String? typeLabel;
  final int? gender;
  final String? countryCode;
  final String? genderLabel;
  final String? lang;
  final bool? isBanned;
  final String? bannedReason;
  final String? bannedAt;
  final int? isNotifiable;
  final String? createdAt;
  final String? updatedAt;
  final String? token;
  final bool isSubscribe;
  final dynamic currentSubscription;
  final dynamic claimServices;
  final dynamic country;
  final ActiveCountryModel? activeCountryModel;
  List<Addresses>? addresses;
  City? city;
  final FileModel? profileImage;

  String get address {
    if (city != null && city!.city != null) {
      return '${city!.city!.name}, ${city!.country?.name ?? ''}';
    }
    return '';
  }

  DateTime? get getBirthDate {
    if (birthDate == null || birthDate!.isEmpty) return null;
    try {
      return DateTime.parse(birthDate!);
    } catch (e) {
      return null;
    }
  }

  UserModel({
    this.birthDate,
    this.profileImage,
    this.id,
    this.city,
    this.countryCode,
    this.name,
    this.email,
    this.isVerified,
    this.mobile,
    this.mobileCode,
    this.mobileNumber,
    this.type,
    this.typeLabel,
    this.gender,
    this.genderLabel,
    this.lang,
    this.isNotifiable,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.isBanned,
    this.bannedReason,
    this.bannedAt,
    this.isSubscribe = false,
    this.currentSubscription,
    this.claimServices,
    this.country,
    this.addresses,
    this.activeCountryModel
  });

  bool get isVendor => typeLabel?.toLowerCase() == "vendor" || typeLabel?.toLowerCase() == "تاجر";
  bool get isAdmin => typeLabel?.toLowerCase() == "admin" || typeLabel?.toLowerCase() == "مدير";
  bool get customer => typeLabel?.toLowerCase() == "customer"|| typeLabel?.toLowerCase() == "عميل";

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isVerified: json['is_verified'],
      birthDate: json['birth_date'],
      mobile: json['mobile'],
      mobileCode: json['mobile_code'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      type: json['type'],
      typeLabel: json['type_label'],
      gender: json['gender'],
      genderLabel: json['gender_label'],
      lang: json['lang'],
      countryCode: json['country_code'],
      isNotifiable: json['is_notifiable'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      token: json['token'],
      activeCountryModel: json['country'] != null ? new ActiveCountryModel.fromJson(json['country']) : null,
      isBanned: json['is_ban'],
      bannedReason: json['banned_reason'],
      bannedAt: json['banned_at'],
      isSubscribe: json['is_subscribe'] ?? false,
      currentSubscription: json['current_subscription'],
      claimServices: json['claim_services'],
      country: json['country'],
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      profileImage: json['profile'] != null ? FileModel.fromJson(json['profile']) : null,
      addresses: json['addresses'] != null
          ? (json['addresses'] as List).map((e) => Addresses.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'country_code': countryCode,
    'mobile': mobile,
    'mobile_code': mobileCode,
    'birth_date': birthDate,
    'mobile_number': mobileNumber,
    'type': type,
    'type_label': typeLabel,
    'gender': gender,
    'gender_label': genderLabel,
    'lang': lang,
    'is_notifiable': isNotifiable,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'is_ban': isBanned,
    'banned_reason': bannedReason,
    'banned_at': bannedAt,
    'is_subscribe': isSubscribe,
    'current_subscription': currentSubscription,
    'claim_services': claimServices,
    'country': country,
    'profile': profileImage?.toJson(),
    'addresses': addresses?.map((e) => e.toJson()).toList(),
    'city': city?.toJson(),
  };

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? mobileCode,
    String? mobileNumber,
    String? mobile,
    String? birthDate,
    int? type,
    String? typeLabel,
    int? gender,
    String? genderLabel,
    String? lang,
    bool? isBanned,
    String? bannedReason,
    String? bannedAt,
    int? isNotifiable,
    String? createdAt,
    String? updatedAt,
    String? token,
    bool? isSubscribe,
    dynamic currentSubscription,
    dynamic claimServices,
    dynamic country,
    List<Addresses>? addresses,
    City? city,
    FileModel? profileImage,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      mobileCode: mobileCode ?? this.mobileCode,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      birthDate: birthDate ?? this.birthDate,
      type: type ?? this.type,
      typeLabel: typeLabel ?? this.typeLabel,
      gender: gender ?? this.gender,
      genderLabel: genderLabel ?? this.genderLabel,
      lang: lang ?? this.lang,
      isBanned: isBanned ?? this.isBanned,
      bannedReason: bannedReason ?? this.bannedReason,
      bannedAt: bannedAt ?? this.bannedAt,
      isNotifiable: isNotifiable ?? this.isNotifiable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      token: token ?? this.token,
      isSubscribe: isSubscribe ?? this.isSubscribe,
      currentSubscription: currentSubscription ?? this.currentSubscription,
      claimServices: claimServices ?? this.claimServices,
      country: country ?? this.country,
      city: city ?? this.city,
      addresses: addresses ?? this.addresses,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}

class Addresses {
  int? id;
  int? lat;
  int? long;
  String? createdAt;
  String? updatedAt;
  String? buildingName;
  String? streetName;
  String? description;
  String? mobileCode;
  String? mobileNumber;

  Addresses({
    this.id,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
    this.buildingName,
    this.streetName,
    this.description,
    this.mobileCode,
    this.mobileNumber,
  });

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buildingName = json['building_name'];
    streetName = json['street_name'];
    description = json['description'];
    mobileCode = json['mobile_code'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lat'] = lat;
    data['long'] = long;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['building_name'] = buildingName;
    data['street_name'] = streetName;
    data['description'] = description;
    data['mobile_code'] = mobileCode;
    data['mobile_number'] = mobileNumber;
    return data;
  }
}

class City {
  CountriesAndCitiesModel? city;
  CountriesAndCitiesModel? country;

  City({this.city, this.country});

  City.fromJson(Map<String, dynamic> json) {
    city = CountriesAndCitiesModel(id: json['id'], name: json['name']);
    country = json['country'] != null
        ? CountriesAndCitiesModel.fromJson(json['country'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['id'] = city!.id;
      data['name'] = city!.name;
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}