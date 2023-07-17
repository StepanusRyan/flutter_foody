import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cart (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      food TEXT,
      price INTEGER,
      qty INTEGER,
      cashier TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) """);
    await database.execute("""CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      no_nota TEXT,
      food TEXT,
      subTotal INTEGER,
      paymentMethod TEXT,
      cashier TEXT,
      date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) """);
    await database.execute("""CREATE TABLE menus (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      image TEXT,
      price INTEGER
    ) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("prototype.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createData(
      String food, int price, int qty, String cashier) async {
    final db = await SQLHelper.db();
    final cart = {'food': food, 'price': price, 'qty': qty, 'cashier': cashier};
    final id = await db.insert("cart", cart,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> insertTransaction(String nomorNota, String food, int price,
      String paymentMethod, String cashier, String date) async {
    final db = await SQLHelper.db();
    final transaction = {
      'no_nota': nomorNota,
      'food': food,
      'subTotal': price,
      'paymentMethod': paymentMethod,
      'cashier': cashier,
      'date': date
    };
    final id = await db.insert("transactions", transaction,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<void> insertMenu(String name, String image, int price) async {
    final db = await SQLHelper.db();
    final menus = {
      'name': name,
      'image': image,
      'price': price,
    };

    List<Map<String, dynamic>> count =
        await db.rawQuery('SELECT COUNT(id) from menus');
    if (count.length != 0) {
      await db.rawQuery(
          'INSERT INTO menus(name, image, price) VALUES ("${name}", "${image}", ${price})');
    } else {}

    // await db.rawQuery(
    //     'IF NOT EXISTS(SELECT 1 FROM menus WHERE id = 1) BEGIN INSERT INTO menus(name, image, price) VALUES ("${name}", "${image}", ${price}) END');

    // await db.rawQuery(
    //     'INSERT INTO menus(name, image, price) VALUES ("${name}", "${image}", ${price})');

    // final query = await db.rawQuery("SELECT id FROM menus");
    // if (query.isEmpty || query == null) {
    //   await db.rawInsert(
    //       'INSERT INTO menus(name, image, price) VALUES ("${name}", "${image}", ${price})');
    // }
  }
  //  static Future<int> insertMenu(String name, String image, int price) async {
  //   final db = await SQLHelper.db();
  //   final menus = {
  //     'name': name,
  //     'image': image,
  //     'price': price,
  //   };

  //   final id = await db.insert("menus", menus,
  //         conflictAlgorithm: sql.ConflictAlgorithm.replace);
  //   return id;
  // }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SQLHelper.db();
    return db.query('cart', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getAllDataTransactions() async {
    final db = await SQLHelper.db();
    return db.query('transactions', orderBy: 'id DESC');
  }

  static Future<List<Map<String, dynamic>>> getAllDataNotCashier() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT id,food,qty,price FROM "cart"');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query('cart', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getAllFood() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT food FROM "cart"');
    // return db.rawQuery('SELECT food FROM "cart" WHERE food = $food');
  }

  static Future<List<Map<String, dynamic>>> getAllPrice() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT price FROM "cart"');
  }

  static Future<List<Map<String, dynamic>>> getAllQty() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT qty FROM "cart"');
  }

  static Future<List<Map<String, dynamic>>> getAllMenu() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT * FROM "menus"');
  }

  static Future<int> updateData(
      int id, String food, int price, int qty, String cashier) async {
    final db = await SQLHelper.db();
    final data = {
      'food': food,
      'price': price,
      'qty': qty,
      'cashier': cashier,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('cart', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('cart', where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }

  static Future<void> deleteAllCart() async {
    final db = await SQLHelper.db();
    try {
      await db.delete('cart');
    } catch (e) {}
  }
}
