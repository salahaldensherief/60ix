import 'package:sixty_ix/modules/art_core/resources/app_strings.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';
import 'package:x_validators/rules/index.dart';
import 'package:x_validators/validator.dart';

/// Enum have types of validation
enum FieldsValidation {
  name,
  email,
  gender,
  phoneNumber,
  password,
  confirmPassword,
  buildingName,
  streetNumber,
  additionalInfo,
  requiredField,
}

class ValidationHelper {
  static String? Function(String?)? validate(FieldsValidation field, {String? password}) {
    switch (field) {
      case FieldsValidation.requiredField:
        return _validateRequiredField;
      case FieldsValidation.name:
        return _validateNameField;
      case FieldsValidation.confirmPassword:
        return _validateConfirmPasswordField(password);
      case FieldsValidation.gender:
        return _validateGenderField;
      case FieldsValidation.email:
        return _validateEmailField;
      case FieldsValidation.phoneNumber:
        return _validatePhoneNumber;
      case FieldsValidation.password:
        return _validatePassword;
      case FieldsValidation.buildingName:
        return _validateBuildingName;
      case FieldsValidation.streetNumber:
        return _validateStreet;
      case FieldsValidation.additionalInfo:
        return _validateAdditionalInfo;
    }
  }

  static String? _validatePhoneNumber(String? value) {
    return xValidator([
      IsRequired(translate(AppString.requiredPhoneNumber)),
      IsNumber(translate(AppString.phoneInvalid)),
    ])(value);
  }

  static String? _validateNameField(String? value) {
    return xValidator([
      IsRequired(translate(AppString.requiredNameField)),
    ])(value);
  }

  static String? _validateRequiredField(String? value) {
    return xValidator([
      IsRequired(translate(AppString.required)),
    ])(value);
  }

  static String? Function(String?) _validateConfirmPasswordField(String? password) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return translate(AppString.requiredPassword);
      }

      if (password != null && value != password) {
        return translate(AppString.passwordsDoNotMatch);
      }

      return null;
    };
  }

  static String? _validateGenderField(String? value) {
    return xValidator([
      IsRequired(translate(AppString.requiredField)),
    ])(value);
  }

  static String? _validateEmailField(String? value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return xValidator([
      IsRequired(translate(AppString.emailRequired)),
      RegExpRule(emailRegex,translate(AppString.invalidEmailFormat))
    ])(value);
  }

  static String? _validatePassword(String? value) {
    return xValidator([IsRequired(translate(AppString.requiredPassword))])(
      value,
    );
  }

  static String? _validateBuildingName(String? value) {
    return xValidator([IsRequired(translate(AppString.requiredField))])(value);
  }

  static String? _validateStreet(String? value) {
    return xValidator([IsRequired(translate(AppString.requiredField))])(value);
  }

  static String? _validateAdditionalInfo(String? value) {
    return xValidator([IsRequired(translate(AppString.requiredField))])(value);
  }
}
