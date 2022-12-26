abstract class profile_state{

}

class init_profile_state extends profile_state{

}

class change_fromgallary_state extends profile_state{

}
class change_fromcamera_state extends profile_state{

}
class Loading_getprofile_state extends profile_state{

}
class Success_getprofile_state extends profile_state{

}
class Error_getprofile_state extends profile_state{
  String error;
  Error_getprofile_state(this.error);
}

class Loading_Updateprofile_state extends profile_state{

}

class Success_Updateprofile_state extends profile_state{

}

class Error_Updateprofile_state extends profile_state{
  String error;
  Error_Updateprofile_state(this.error);

}
class dropdown_state extends profile_state{

}
class addfiled extends profile_state{

}
class removefield extends profile_state{

}




