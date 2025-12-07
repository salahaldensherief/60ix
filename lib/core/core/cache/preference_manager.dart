import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sixty_ix/modules/core/core.dart';

import '../../shared/data/models/active_countries/active_country_model.dart';
import 'caching_keys.dart';

class PreferenceManager {
  void saveLatitude(double latitude) =>
      GetStorage().write(CachingKey.LATITUDE, latitude);

  String latitude() => GetStorage().read(CachingKey.LATITUDE)?.toString() ?? '';

  void saveLongitude(double longitude) =>
      GetStorage().write(CachingKey.LONGITUDE, longitude);

  String longitude() =>
      GetStorage().read(CachingKey.LONGITUDE)?.toString() ?? '';

  void saveFCMToken(String fcmToken) =>
      GetStorage().write(CachingKey.FCM_TOKEN, fcmToken);

  String fcmToken() => GetStorage().read(CachingKey.FCM_TOKEN) as String? ?? "";

  void saveIsFirstTime(bool isFirstTime) =>
      GetStorage().write(CachingKey.IS_FIRST_TIME, isFirstTime);

  bool isFirstTime() =>
      GetStorage().read(CachingKey.IS_FIRST_TIME) as bool? ?? true;

  void saveIsOpenAsGuestUser(bool isGustUser) =>
      GetStorage().write(CachingKey.IS_GUEST_USER, isGustUser);

  bool isOpenAsGuestUser() =>
      GetStorage().read(CachingKey.IS_GUEST_USER) as bool? ?? false;

  void saveIsLoggedIn(bool isLoggedIn) =>
      GetStorage().write(CachingKey.IS_LOGGED_IN, isLoggedIn);

  bool get isLoggedIn =>
      GetStorage().read(CachingKey.IS_LOGGED_IN) as bool? ?? false;

  void saveAuthToken(String? authToken) =>
      GetStorage().write(CachingKey.AUTH_TOKEN, authToken ?? '');

  String authToken() =>
      GetStorage().read(CachingKey.AUTH_TOKEN) as String? ?? "";

  void saveToken(String? cooke) =>
      GetStorage().write(CachingKey.TOKEN, cooke ?? '');

  String token() => GetStorage().read(CachingKey.TOKEN) as String? ?? "";

  bool get isSubscribed => getUserData()?.isSubscribe ?? false;

  void saveFullName(String? fullName) =>
      GetStorage().write(CachingKey.FullName, fullName ?? '');

  String? fullName() => GetStorage().read(CachingKey.FullName) as String? ?? "";
  String? phoneNumber() => getUserData()?.mobileNumber ?? '';
  String? countryCode() => getUserData()?.countryCode ?? '';

  void saveValue(String cachingKey, String value) =>
      GetStorage().write(cachingKey, value);

  String getValue(String cachingKey) => GetStorage().read(cachingKey) as String;

  void saveLanguage(String lang) =>
      GetStorage().write(CachingKey.LANGUAGE, lang);

  String currentLang() =>
      GetStorage().read(CachingKey.LANGUAGE) as String? ??
      Platform.localeName.split("_").firstOrNull ??
      'en';

  void saveUserId(String? userId) =>
      GetStorage().write(CachingKey.UserId, userId ?? '');

  String? userId() => GetStorage().read(CachingKey.UserId) as String? ?? "";

  void saveUserData(UserModel user) =>
      GetStorage().write(CachingKey.UserData, user.toJson());


  UserModel? getUserData() {
    final data = GetStorage().read(CachingKey.UserData);
    if (data == null) return null;
    return UserModel.fromJson(data);
  }

  bool? isDarkMode() => GetStorage().read(CachingKey.IS_DARK_MODE) as bool?;

  void setDarkMode(bool isDarkMode) =>
      GetStorage().write(CachingKey.IS_DARK_MODE, isDarkMode);

  bool? isGuestUser() => authToken().isEmpty;


  void saveActiveCountry(ActiveCountryModel activeCountry) =>
      GetStorage().write(CachingKey.ActiveCountry, activeCountry.toJson());
  ActiveCountryModel? getActiveCountry() {
    final data = GetStorage().read(CachingKey.ActiveCountry);
    if (data == null) return null;
    return ActiveCountryModel.fromJson(data);
  }


  void logout() {
    GetStorage().remove(CachingKey.UserData);
    GetStorage().remove(CachingKey.AUTH_TOKEN);
    GetStorage().remove(CachingKey.FullName);
    saveIsLoggedIn(false);
    saveIsOpenAsGuestUser(true);
  }

  void login({
    required String authToken,
    required UserModel user,
    bool rememberMe = false,
  }) {
    saveIsOpenAsGuestUser(false);
    saveAuthToken(authToken);
    saveIsLoggedIn(true);
    saveFullName(user.name);
    saveUserData(user);
  }

  void changeLanguage(BuildContext context, String lang) {
    if (currentLang() == lang) return;
    context.setLocale(Locale(lang));
    saveLanguage(lang);
  }
}
