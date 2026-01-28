String? validateConfirmPassword({
  required String? value,
  required String password,
}) {
  if (value == null || value.isEmpty) {
    return "Please confirm your password";
  }

  if (value != password) {
    return "Passwords do not match";
  }

  return null;
}
