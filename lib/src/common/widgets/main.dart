import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../service/db_service.dart';
import 'app.dart';

void main() {
  SqfliteDataBase().initializeDatabase();
  runApp(const App());
}