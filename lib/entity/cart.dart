import 'package:floor/floor.dart';
import 'dart:convert';

@entity
class Cart {
  @PrimaryKey(autoGenerate: true)
  final int id;
  String nameFood;
  int price;
  int qty;

  Cart({
    required this.id,
    required this.nameFood,
    required this.price,
    required this.qty,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      nameFood: json['food'],
      price: json['price'],
      qty: json['qty'],
      // cashier: json['cashier'],
    );
  }
}



// var listDataMakanan = [
//   DataMakanan(
//       nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
//   DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
//   DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 13000),
//   DataMakanan(
//       nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 15000),
//   DataMakanan(
//       nama: "Nasi Ayam Goreng",
//       image: "assets/nasiayamgoreng.png",
//       harga: 15000),
//   DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 15000),
//   DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
//   DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 15000),
//   DataMakanan(
//       nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
//   DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),
// ];
