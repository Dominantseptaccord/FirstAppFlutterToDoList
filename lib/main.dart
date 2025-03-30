import 'package:flutter/material.dart'; // подключаем базовый набор виджетов
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/routes/todo.dart';
import 'routes/second.dart';
void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('buxer');
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: SecondPage()
    );
  }
}