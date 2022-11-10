class User{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  String? address;
  int groupId = 1;

  String? adminId;
  String? apiToken;


  User();

  User.fromJson(data) {
    id = data['id'];
    firstName = data['firstname'];
    lastName = data['lastname'];
    email = data['email'];
    if(data['custom_attributes'] != null){
      for(var i in (data['custom_attributes'] as List)){
        if(i['attribute_code'] == 'tel'){
          phone = i['value'];
        }
        if(i['attribute_code'] == 'admin_id'){
          adminId = i['value'];
        }
        if(i['attribute_code'] == 'api_token'){
          apiToken = i['value'];
        }
        if(i['attribute_code'] == 'avatar'){
          avatar = 'https://elogexpress.com/pub/media/customer/' + i['value'];
        }

      }
    }

    if(data['group_id'] != null){
      groupId = data['group_id'];
    }
  }


  String fullName(){
    String name = '';

    if(firstName != null){
      name += firstName!;
    }
    if(lastName != null){
      name += ' ' + lastName!;
    }
    return name;
  }
}