class Menu {
  final int id;
  final String name;
  final String image;
  final int price;

  const Menu(
      {required this.id,
      required this.name,
      required this.image,
      required this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }
}
