class DataMakanan {
  String nama;
  String image;
  int harga;

  DataMakanan({required this.nama, required this.image, required this.harga});

  // DataMakanan.fromJson(Map json)
  // :id = json['id'],
  // :name = json['name'],
  // :image = json['image'],
  // :price = json['price'];

  // Map toJson(){
  //   return{'id': id, 'name': name, 'image': image, 'price': price};
  // }

}

var listDataMakanan = [
  //1
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //2
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //3
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //4
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //5
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //6
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //7
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //8
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //9
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //10
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //11
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //12
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //13
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //14
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //15
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //16
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //17
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //18
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //19
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),

  //20
  DataMakanan(
      nama: "Nasi Goreng", image: "assets/nasigoreng.png", harga: 15000),
  DataMakanan(nama: "Mie Goreng", image: "assets/miegoreng.png", harga: 15000),
  DataMakanan(nama: "Nasi Timlo", image: "assets/nasitimlo.png", harga: 12000),
  DataMakanan(
      nama: "Nasi Soto Ayam", image: "assets/nasisoto.png", harga: 14000),
  DataMakanan(
      nama: "Nasi Ayam Goreng",
      image: "assets/nasiayamgoreng.png",
      harga: 16000),
  DataMakanan(nama: "Nasi Rawon", image: "assets/nasirawon.jpg", harga: 20000),
  DataMakanan(nama: "Bubur Ayam", image: "assets/buburayam.jpg", harga: 13000),
  DataMakanan(nama: "Nasi Pecel", image: "assets/nasipecel.jpg", harga: 10000),
  DataMakanan(
      nama: "Rujak Cingur", image: "assets/rujakcingur.png", harga: 15000),
  DataMakanan(nama: "Gado - gado", image: "assets/gadogado.jpg", harga: 15000),
];
