class AuthValidator {
  static String? providerCodeValidator(String? providerCode) {
    if (providerCode == null || providerCode.isEmpty) {
      return 'This field can not be empty';
    }
    if (providerCode.length < 5|| providerCode.length>10) {
      return 'Text Value between 5 to 10 character';
    }
    return null;
  }

  static String? deviceCodeValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field can not be empty';
    }
    if (value.length < 5|| value.length>10) {
      return 'Text Value between 5 to 10 character';
    }
    return null;
  }

  static String? deviceSecretValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field can not be empty';
    }
    if (value.length < 6|| value.length>10) {
      return 'Text Value between 6 to 10 character';
    }
    return null;
  }

  static String? agentCodeValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field can not be empty';
    }
    if (value.length < 4|| value.length>10) {
      return 'Text Value between 6 to 10 character';
    }
    return null;
  }

  static String? pinCodeValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter pin code';
    }
    if (value.length < 5) {
      return 'wrong pin code Try Again';
    }
    return null;
  }

  static String? vehicleLetterValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter Vehicle letters';
    }
    if (value.length < 3 || value.length > 6) {
      return 'This field must be between 3 and 6 characters';
    }
    return null;
  }

  static String? vehicleNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter Vehicle numbers';
    }
    if (value.length < 4 || value.length > 4) {
      return 'This field must be between 4 characters';
    }
    return null;
  }

  static String? fuelMeterValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter Fuel amount';
    }
    if (value.length < 1 || value.length > 3) {
      return 'This field must be between 1 to 3 characters';
    }
    return null;
  }

  static String? odooMeterValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter Odoo Meter numbers';
    }
    if (value.length < 2 || value.length > 6) {
      return 'This field must be between 2 to 6 characters';
    }
    return null;
  }

  static String? titleValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your title first';
    }
    return null;
  }

  static String? messageValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field can not be empty ';
    }
    return null;
  }
}
