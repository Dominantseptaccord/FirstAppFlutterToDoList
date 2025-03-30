import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recipe_app/routes/dialog_show.dart';
import 'package:recipe_app/routes/todo.dart';
import 'dialog_show.dart';
import 'package:recipe_app/localDatabaseList/databaseToDoList.dart';

class SecondPage extends StatefulWidget {

  const SecondPage({super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
  final box = Hive.box('buxer');
  final TextEditingController _controller = TextEditingController();
  DatabaseToDoList db = DatabaseToDoList();
  @override
  void initState() {
    if(box.get('TODOLIST')==null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  void saveTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }
  void createTask(){
    showDialog(
        context: context,
        builder: (context) {
          return dialogShow(
            controller: _controller,
            taskSaved: saveTask,
            taskCanceled: () => Navigator.of(context).pop(),
          );
        }
    );
  }
  void checkBoxChanged(int val, bool? boolean){
    setState(() {
      db.toDoList[val][1] = !db.toDoList[val][1];
    });
    db.updateDataBase();
  }
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyName'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          createTask();
        }
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Todo(
            taskName: db.toDoList[index][0],
            isCompleted: db.toDoList[index][1],
            onChanged: (boolean) => checkBoxChanged(index,boolean),
            deleteTask: () => deleteTask(index),
          );
        }
      )
    );
  }
}
