import 'package:hive_flutter/hive_flutter.dart';
class DatabaseToDoList{
  List toDoList = [];
  final _mybox = Hive.box("buxer");

  void createInitialData(){
    toDoList = [['Hi',false],['lol',true]];
  }
  void loadData(){
    toDoList = _mybox.get('TODOLIST');
  }
  void updateDataBase(){
    _mybox.put('TODOLIST',toDoList);
  }
}