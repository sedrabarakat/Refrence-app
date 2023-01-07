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

class Loading_getbookeddate_state extends profile_state{

}

class Success_getbookeddate_state extends profile_state{

}

class Error_getbookeddate_state extends profile_state{
  String error;
  Error_getbookeddate_state(this.error);
}


class Loading_addConsultation_state extends profile_state{

}

class Success_addConsultation_state extends profile_state{

}

class Error_addConsultation_state extends profile_state{
  String error;
  Error_addConsultation_state(this.error);
}

class Loading_RemoveConsultation_state extends profile_state{

}

class Success_RemoveConsultation_state extends profile_state{

}

class Error_RemoveConsultation_state extends profile_state{
  String error;
  Error_RemoveConsultation_state(this.error);
}

class Loading_experience_state extends profile_state{

}

class Success_experience_state extends profile_state{

}

class Error_experience_state extends profile_state{
  String error;
  Error_experience_state(this.error);
}


class Loading_Removeexperience_state extends profile_state{

}

class Success_Removeexperience_state extends profile_state{

}

class Error_Removeexperience_state extends profile_state{
  String error;
  Error_Removeexperience_state(this.error);
}


