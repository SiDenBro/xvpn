class Validator {
  static bool isValidPhone(String phone) => RegExp(r'^[\d\s\-\+\(\)]{10,15}$').hasMatch(phone);
}
