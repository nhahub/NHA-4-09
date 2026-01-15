import 'app_regex.dart';

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return "Please enter your password";
  if (!AppRegex.hasMinLength(value)) {
    return "Password must be at least 8 characters.";
  }
  if (!AppRegex.hasUpperCase(value)) {
    return "Password must contain at least one uppercase letter.";
  }
  if (!AppRegex.hasNumber(value)) {
    return "Password must contain at least one digit.";
  }
  if (!AppRegex.hasSpecialCharacter(value)) {
    return "Password must contain at least one special character.";
  }
  return null;
}
