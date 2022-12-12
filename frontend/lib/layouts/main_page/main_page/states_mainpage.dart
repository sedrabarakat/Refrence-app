abstract class layout_state{}

class init_state extends layout_state{}

class change_index extends layout_state{}

class change_eyesuffix extends layout_state{}

class Success_login_state extends layout_state{}

class Error_login_state extends layout_state{
  String error;
  Error_login_state(this.error);
}

class Loading_login_state extends layout_state{}

class Loading_getexpert extends layout_state{}

class Success_getexpert extends layout_state{}

class Error_getexpert extends layout_state{
  String error;
  Error_getexpert(this.error);
}