import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_demo/dao/dog.dart';
import 'package:floor_demo/model/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart';


@Database(version: 2, entities: [Dog])
abstract class TestDatabase extends FloorDatabase {

  DogDao get dogDao;
}