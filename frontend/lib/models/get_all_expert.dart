

import 'dart:convert';
/*
class all_expert{
  List <get_expert>all=[];

  all_expert.fromJson(Map<String,dynamic>json){
    json.forEach((key, value) {all.add(get_expert.fromjson(value));});
  }
}*/

class get_expert_model{
  int? expert_id;
  String? country;
  String? city;
  String? street;
  int? hour_charging;
  user ?normal_user;
  get_expert_model.fromjson(Map<String,dynamic>json){
    expert_id=json['expert_id'];
    country=json['country'];
    city=json['city'];
    street=json['street'];
    hour_charging=json['hour_charging'];
    normal_user=user.fromjson(json['normal_user']);
  }

}
class user{
  int?user_id;
  String ?first_name;
  String ?last_name;
  String? image;
  String? wallet;
  bool ?is_expert;
  String ?updated_at;
  String ?created_at;
  user.fromjson(Map<String,dynamic>json){
    user_id=json['user_id'].tojson();
    first_name=json['first_name'].tojson();
    last_name=json['last_name'].tojson();
    image=json['image'].tojson();
    wallet=json['wallet'].tojson();
    is_expert=json['is_expert'].tojson();
    updated_at=json['updated_at'].tojson();
    created_at=json['created_at'].tojson();

  }

}