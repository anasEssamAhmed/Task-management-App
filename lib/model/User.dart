
class User {
  String? email;
  String? name;
  String? password;
  User(this.email , this.name , this.password);

  Map<String, dynamic> toMap(){
    return {"email" : email , "name" : name , "password" : password};
  }

  User.fromMap(Map map){
    email = map["email"];
    name = map["name"];
    password = map["password"];
  }


}