import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Todo extends StatelessWidget {
  final String taskName;
  final bool? isCompleted;
  Function(bool?)? onChanged;
  Function()? deleteTask;
  Todo({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteTask,
});
  Widget build(BuildContext context){
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Slidable(
          endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => deleteTask!(),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(19.0),
          ),
          padding: EdgeInsets.all(25.0),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
              ),
              Text(taskName,
                style: TextStyle(
                    decoration: isCompleted! ? TextDecoration.lineThrough : TextDecoration.none),),
            ],
          ),
        ),
        ),
      );
  }
}