class User {
  String? firstName, lastName, email, password, phoneNumber, codecontry;

  // List<>

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    codecontry = json['country_number'];
  }
}