
import '../system_config/system_constants.dart';

/// Represents the gender types with support for conversion from ID or name.
///
/// Example1: Conversion from ID
///

/// final genderId = 1; // Example fetched ID
/// final GenderType? gender = GenderType.fromId(genderId);
/// if (gender == GenderType.male) {
///   print('Gender is Male');
/// } else if (gender == GenderType.female) {
///   print('Gender is Female');
/// } else {
///   print('Unknown Gender');
/// }
///

///
/// Example2: Conversion from Name
///
/// final genderName = 'ذكر'; // Example fetched Name
/// final GenderType? gender = GenderType.fromName(genderName);
/// if (gender == GenderType.male) {
///   print('Gender is Male');
/// } else if (gender == GenderType.female) {
///   print('Gender is Female');
/// } else {
///   print('Unknown Gender');
/// }
///

class GenderType extends SystemConstant {
  static const List<GenderType> values = [male, female];

  /// Male gender type
  static const GenderType male = GenderType(1, 'male');

  /// Female gender type
  static const GenderType female = GenderType(2, 'female');

  const GenderType(super.id, super.name);

  /// Returns the corresponding GenderType based on the provided ID.
  ///
  /// Returns null if the ID does not match any gender type.
  static GenderType? fromId(int id) {
    switch (id) {
      case 1:
        return male;
      case 2:
        return female;
      default:
        return null;
    }
  }

  /// Returns the corresponding GenderType based on the provided name.
  ///
  /// Accepts names in Arabic and English, case-insensitive.
  /// Returns null if the name does not match any gender type.
  static GenderType? fromName(String name) {
    if (name == 'Male' || name == 'male' || name == 'MALE' || name == 'ذكر') {
      return male;
    } else if (name == 'Female' ||
        name == 'female' ||
        name == 'FEMALE' ||
        name == 'انثى') {
      return female;
    } else {
      return null;
    }
  }
}
