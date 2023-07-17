import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_foody/dao/cartDAO.dart';
import 'package:flutter_foody/entity/cart.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// part "database.g.dart";

@Database(version: 1, entities: [Cart])
abstract class AppDatabase extends FloorDatabase {
  CartDAO get cartDao;
}
