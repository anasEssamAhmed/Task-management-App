class Task {
  String? name;
  bool? isComplete;
  String? user_email;
  Task(this.name ,this.user_email,[this.isComplete = false]);
  Map<String,dynamic> toMap(){
    return {"name" : name , "isComplete" : isComplete == true ? 1 : 0 , "user_email" : user_email};
  }
  Task.formMap(Map map){
    name = map["name"];
    isComplete = map["isComplete"] == 1 ? true : false;
    user_email = map["user_email"];
  }
}