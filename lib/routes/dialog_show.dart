import 'package:flutter/material.dart';
import 'second.dart';

class dialogShow extends StatelessWidget{
  final controller;
  Function()? taskSaved;
  Function()? taskCanceled;
  dialogShow({super.key,required this.controller, this.taskSaved, this.taskCanceled});
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 114,
        child: Column(children:
            [
            TextField(
              controller: controller,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'My GOAL!'
          ),
        ),
              Padding(
                  padding: EdgeInsets.all(5.0),
              child:
              Row( children: [
              ElevatedButton(
                  onPressed: taskSaved,
                  child: Text('Save'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)
                  ),
              ),
                ElevatedButton(
                    onPressed: taskCanceled,
                    child: Text('Cancel'),
                )
  ]),
      )
      ]),
      ),
    );
  }
}