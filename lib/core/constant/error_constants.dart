class ErrorValidator {
  static const String eUserNullError = "Please Enter a username";
  static const String eFirstNullError = "Please Enter your name";
  static const String eLastNullError = "Please Enter your lastname";
  static const String efoneNullError = "Please Enter your phone number";
  static const String efoneValidationError = "Invalide phone number";
  static const String eCnamNullError = "Please Enter your code cnam";
  static const String eUserLengthError =
      "Username must be more then 4 caractere";
  static const String eFirstLengthError =
      "first name must contain  more than 4 characters";
  static const String eLastLengthError = "name required at least 4 characters ";
  static const String eEmailNullError = "Please Enter your Email";
  static const String eInvalidEmailError = "Please Enter valid Email";
  static const String ePassNullError = "Please Enter your password ";
  static const String eShortPasswordError = "Password is too short";
  static const String ePassConNullError = "Please Enter your Confirm password ";
  static const String ePassConNonConformError = "Password is not confirm";
  static const String eoneisemty = "value 1 is empty";
  static const String etwoisemty = "value 2 is empty";
  static const String ethreeisemty = "value 3 is empty";
  static const String efourisemty = "value 4 is empty";
  static const String efiveisemty = "value 5 is empty";
  static const String eValue = " value must be integer";

  static List<String> isvalue = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  static List<String> invalidvalue = [
    "1",
    "3",
    "4",
    "6",
    "7",
    "8",
  ];

  static RegExp emailvalidatorRexExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
