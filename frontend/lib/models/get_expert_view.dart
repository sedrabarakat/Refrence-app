
class Expertclass {
  Expertclass({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.codecontry,
    required this.country,
    required this.city,
    required this.street,
    required this.hourchaerg
  });
  String firstName,lastName,email,password,phoneNumber,codecontry,country,city,street;
  int hourchaerg;
  String ?image;
  factory Expertclass.fromJson(Map<String, dynamic> json) {
    return Expertclass(
        firstName : json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        codecontry: json['country_number'],
        country:json['country'],
        city:json['city'],
        street:json['street'],
        hourchaerg:json['hourchaerg']
    );
  }

}