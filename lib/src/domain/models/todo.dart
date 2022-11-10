import 'package:riverpod_base/src/data/datasource/database/database_config.dart';

class Todo {
  int? id;
  String? title;
  String? description;
  bool isCompleted = false;
  DateTime? dueDate;

  Todo({
    this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.dueDate,
  });

  Todo.fromJson(json){
    id = json[DBConfig.TODO_ID];
    title = json[DBConfig.TODO_TITLE];
    description = json[DBConfig.TODO_DESCRIPTION];
    isCompleted = json[ DBConfig.TODO_IS_COMPLETE] == 1 ? true : false;
    dueDate = DateTime.parse(json[DBConfig.TODO_DUO_DATE]);
  }

  Map<String, dynamic> toJson(){
    return {
      DBConfig.TODO_ID : id,
      DBConfig.TODO_TITLE : title,
      DBConfig.TODO_DESCRIPTION : description,
      DBConfig.TODO_IS_COMPLETE : isCompleted ? 1 : 0,
      DBConfig.TODO_DUO_DATE : dueDate.toString()
    };
  }
}