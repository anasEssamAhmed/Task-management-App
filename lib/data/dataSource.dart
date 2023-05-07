
import 'package:to_do_app/model/task.dart';

class DataSource {
  // في البداية عبارة عن بيانات وهمية ولكن بعد ذلك سوف يتم استخدام ال sqflite في التخزين
  static List<Task> listToTask = [
    Task("Studying"),
    Task("Go To School" , true),
    Task("Go To Unvirsety"),
    Task("Playing football"),
    Task("Take a walk in the park" , true),
    Task("Play a sport" , true),
    Task("Going to work"),
    Task("Visit the family home"),
  ];
}