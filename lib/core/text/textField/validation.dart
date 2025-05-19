import 'package:get/get.dart';

class Validation {
  // static RegExp emailRegExp = RegExp(
  //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  // );
  // static RegExp phoneRegExp = RegExp(
  //   r'^(?:\+?2)?(?:0|\+?20)?(?:1[0125]|[2-9]\d)\d{8}$',
  // );



  static String? nameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Enter your name please";
  }
  if (value.trim().length < 2) {
    return "name is too short";
  }
   final nameRegExp = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');

  if (!nameRegExp.hasMatch(value.trim())) {
    return "name should be characters only";
  }
  return null;
}


  static String? titleValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your title';
    }
    if (value.length < 3) {
      return 'Title must be at least 3 characters';
    }
    return null;
  }



static String? phoneNumberValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Enter phone number please";
  }

  final trimmed = value.trim();

  if (trimmed.length != 10) {
    return "Phone number must be 10 digits";
  }

  // Check if starts with allowed prefixes
  if (!RegExp(r'^(10|11|12|15)\d{8}$').hasMatch(trimmed)) {
    return "Phone number must start with 10, 11, 12, or 15";
  }

  return null;
}




 static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter password please";
    }
    if (value.trim().length < 8) {
      return "enter 8 characters at least";
    }
    // if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
    //   return "Password must contain at least one [uppercase letter, lowercase letter, number, special character]";
    // }
    
   RegExp passwordRegExp = RegExp(
    r'^(?=(?:[^A-Z]*[A-Z]){1,}[^A-Z]*$)(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&^+()#!~:<>{}\[\]_.]{1})[A-Za-z\d@$!%*?&^_+()#!~:<>{}\[\].]{8,}$',
  );
     if (!passwordRegExp.hasMatch(value.trim())) {
      return "Password must contain at least one [uppercase letter, lowercase letter, number, special character]";
    }
    return null;
  }



static String? numberValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter a number";
  }
  return null;
}
static String? paragraphValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter a message";
  }
  return null;
}


static String? dateValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter a date";
  }
  return null;
}


static String? levelValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Please select one";
  }
  return null;
}

static String? addressValidator(String? value) {
    value = value?.trim();

  if (value == null || value.isEmpty) {
    return 'Please enter an address.';
  }

  final RegExp regex = RegExp(r'^[A-Za-z0-9\s,.-]+$');

  if (!regex.hasMatch(value)) {
    return 'Address can only contain letters, numbers, [, . -] and spaces.';
  }

  if (value.length < 5) {
    return 'Address must be at least 5 characters long.';
  }
  
  if (value.length > 200) {
    return 'Address cannot exceed 200 characters.';
  }
  return null;
}


}