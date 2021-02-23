class Validator {
  static String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String validatePhoneNumber(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String validatePasswordLength(String value) {
    if (value.length == 0) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return "Password must be longer than 6 characters";
    }
    return null;
  }

  static String validateCodeLength(String value) {
    if (value.length == 0) {
      return "Code can't be empty";
    } else if (value.length < 4) {
      return "invalid code";
    }
    return null;
  }

  static String validateNormalText(String value) {
    if (value.length == 0) {
      return "This Value can't be empty";
    }
    return null;
  }

  static String validateEmpty(String value) {
    if (value.length == 0) {
      return "";
    }
    return null;
  }

  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
  }
}
