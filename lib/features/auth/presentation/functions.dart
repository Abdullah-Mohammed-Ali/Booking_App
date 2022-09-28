import 'package:booking_app/features/auth/presentation/const_strings.dart';

String? emailValidator(String value) {
  if (!checkEmptyField(value)) {
    if (!value.contains('@') || !value.contains('.com')) {
      return emailValidation;
    }
  } else {
    return 'Email$emptyValidation';
  }
}

String? usernameValidation(String value) {
  if (checkEmptyField(value)) {
    return 'Username$emptyValidation';
  }
}

String? passwordValidator(String value) {
  if (!checkEmptyField(value)) {
    if (value.length < 6) {
      return passwordValidation;
    }
  } else {
    return 'Password$emptyValidation';
  }
}

String? passwordConfirmationValidator(String value, String password) {
  if (!checkEmptyField(value)) {
    if (value != password) {
      return passwordConfirmationValidation;
    }
  } else {
    return 'Password confirmation$emptyValidation';
  }
}

bool checkEmptyField(String value) {
  if (value.isEmpty) return true;
  return false;
}
