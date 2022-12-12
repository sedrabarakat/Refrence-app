class loginModel{
  String?token;



  //named constructor ((which will get the value from json))
  loginModel.fromjson(String value){
    token=value;
  }


}