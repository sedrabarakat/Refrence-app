abstract class pro_states{}

class pro_init extends pro_states{}

class pro_Loading_getprofile extends pro_states{}

class pro_Success_getprofile extends pro_states{}

class pro_Error_getprofile extends pro_states{
  String error;
  pro_Error_getprofile(this.error);
}

class pro_Loading_create_fav extends pro_states{}

class pro_Success_create_fav extends pro_states{}

class pro_Error_create_fav extends pro_states{
  String error;
  pro_Error_create_fav(this.error);
}

class pro_Loading_delete_fav extends pro_states{}

class pro_Success_delete_fav extends pro_states{}

class pro_Error_delete_fav extends pro_states{
  String error;
  pro_Error_delete_fav(this.error);
}

class pro_Loading_add_rating extends pro_states{}

class pro_Success_add_rating extends pro_states{}

class pro_Error_add_rating extends pro_states{
  String error;
  pro_Error_add_rating(this.error);
}
class pro_Loading_delete_rating extends pro_states{}

class pro_Success_delete_rating extends pro_states{}

class pro_Error_delete_rating extends pro_states{
  String error;
  pro_Error_delete_rating(this.error);
}
class pro_Success_ret extends pro_states{}

class pro_reserve_click extends pro_states{}
//get_freetimes_bydate

class pro_Loading_get_freetimes_bydate extends pro_states{}

class pro_Success_get_freetimes_bydate extends pro_states{}

class pro_Error_get_freetimes_bydate extends pro_states{
  String error;
  pro_Error_get_freetimes_bydate(this.error);
}

class pro_Loading_Book_Date extends pro_states{}

class pro_Success_Book_Date extends pro_states{}

class pro_Error_Book_Date extends pro_states{
  String error;
  pro_Error_Book_Date(this.error);
}
class pro_Success_adding_counter extends pro_states{}
class pro_Success_Minus_Counter extends pro_states{}
class pro_Success_write_Counter extends pro_states{}

class pro_Loading_AllFreeTime extends pro_states{}

class pro_Success_AllFreeTime extends pro_states{}

class pro_Error_AllFreeTime extends pro_states{
  String error;
  pro_Error_AllFreeTime(this.error);
}