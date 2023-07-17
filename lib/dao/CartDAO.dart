import 'package:floor/floor.dart';
import 'package:flutter_foody/entity/cart.dart';

@dao
abstract class CartDAO {
  @Query("SELECT * FROM Cart")
  Stream<List<Cart>> getAllCart();
  @Query("DELETE FROM Cart")
  Stream<void> deleteAllCart();
  @insert
  Future<void> insertCart(Cart cart);
  @delete
  Future<void> deleteCart(Cart cart);
}
