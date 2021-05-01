// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/category_dao.dart';
import 'dao/task_dao.dart';
import 'entities/category.dart';
import 'entities/datetime_converter.dart';
import 'entities/task.dart';

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Category, Task])
abstract class AppDatabase extends FloorDatabase {
  CategoryDao get categoryDao;

  TaskDao get taskDao;
}
