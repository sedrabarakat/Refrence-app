
class Expertclass {

  String? firstName,lastName,codecontry,country,city,street;
  bool? is_expert;
  double? wallet;
  double ?hourchaerg;
  String ?image;
  phone_number ?phoneNumber;
  Expertclass.fromJson(Map<String, dynamic> json)
  {

    firstName =json['firstName'];
    lastName=json['lastName'];
    codecontry=json['country_number'];
    country=json['country'];
    city=json['city'];
    street=json['street'];
    hourchaerg=json['hourchaerg'];
    phoneNumber=phone_number.fromJson(json['phone_numbers']);
  }

}

class phone_number{
  int ?phonenumber;
  String ?country_number;
  phone_number.fromJson(Map<String, dynamic> json)
  {
    phonenumber=json['phone_number'];
    country_number=json['country_number'];
  }


}