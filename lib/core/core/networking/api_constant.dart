import 'package:sixty_ix/env_config_env.dart'; // make sure path matches

class ApiConfigurations {
  // Server
  static String get baseUrl =>
      // 'https://api.60ix.com/api'; /// Live = Production
    // 'https://dashboard.60ix.com/api'; /// DEV
    AppConfigEnv.apiBaseUrl ;


  //------------------ Scopes ------------------//
  static const String scopeMobileMini = 'scope=mobile_mini';
  static const String scopeMobile = 'scope=mobile';

  //? Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String verifyOtp = '/auth/verify-code';
  static const String setPassword = '/auth/set-password';
  static const String forgetPassword = '/auth/forget-password';

  static const String countries = '/dashboard/countries';
  static const String cities = '/dashboard/cities';

  //? account
  static const String contactUs = '/contact-us';
  static const String getContactUs = '/settings/contact_us';
  static const String getTermsConditions =
      '/settings/terms_conditions_end_user';



  static const String getAboutSixtyIx =
      '/settings/about_us_end_user';

  static const String getPrivacyAndPolicy = '/settings/privacy_policy_end_user';
  static const String changePassword = '/change-password';
  static const String profile = '/profile';
  static const String deleteAccount = '/delete-account';
  static const String sendOtpDeleteAccount = '/send-otp-delete';

  /// Community
  static const String communityPosts = '/posts';

  static String editPost(int postId) => '/dashboard/posts/$postId';
  static const String listCommunities = '/communities';
  static const String listComments = '/comments';
  static const String hashTags = '/hash-tags';
  static const String deletePost = '/dashboard/posts';
  static const String getReportReasons = '/report-reasons';
  static const String createReport = '/reports';


  //? addresses
  static const String addressesList = '/addresses';
  static const String addAddress = '/addresses';
  static const String editAddress = '/addresses';
  static const String setDefaultAddress = '/addresses';
  static const String deleteAddress = '/addresses';

  //? Home
  static const String home = '/home?$scopeMobileMini';
  static const String banners = '/banners';

  //? Events
  static const String events = '/community';

  //? shared
  static const String uploadDocument = '/files';
  static const String uploadManyDocument = '/upload-many';
  static const String activeCountries = '/active-countries';

  //? Categories
  static const String categories = '/categories';
  static const String subCategories = '/sub-categories';

  //? toggle favourites
  static const String toggleFavourites = '/make-favourite';
  static const String getFavourites = '/my-favourites';

  //? services
  static const String services = '/services?$scopeMobileMini';
  static const String serviceDetails = '/services';
  static const String createDiscount = '/create-claim';
  static const String discountDetails = '/claim';
  static const String getMyDiscounts = '/my-claims';
  static const String rates = '/rates?$scopeMobile';
  static String cancelClaim(int claimId) => '/claim/$claimId/cancel';

  //? vendors
  static const String vendors = '/vendors';
  static const String reviews = '/rates?scope=mobile';

  //? Search
  static const String search = '/search';
  static const String searchHistory = '/search-history';
  static const String deleteHistory = '/delete-history';

  //? Subscription Plans
  static const String subscriptionPlans = '/plans';
  static const String subscriptions = '/subscriptions';

  /// notifications
  static const String notifications = '/notifications';
  static const String notificationsUnread = '/notifications/unread-count';
  static const String notificationsMarkAllAsRead =
      '/notifications/mark-all-as-read';

  //? make-rate
  static const String makeRate = '/make-rate';
  static const String getAppVersion = '/settings/mobile_version';
}
