import 'package:floor/floor.dart';

@entity
class Transactions {
  final int id;
  final String nameFood;
  final String price;
  final int qty;

  Transactions(this.id, this.nameFood, this.price, this.qty);
}
