import 'package:flutter/Material.dart';

class MyValidators {
  static String? displayNamevalidator(
      String? displayName, BuildContext context) {
    if (displayName == null || displayName.isEmpty) {
      return 'name can"t be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Name can"t less Than 3 Cracter';
    }
    return null; // Return null if display name is valid
  }
}
