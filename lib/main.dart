import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/todo_provider.dart';
import 'package:provider/provider.dart';

// import 'package:provider/provider.dart';
import './src/my_app.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
    )
  ], child: MyApp()));
}
