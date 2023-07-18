// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'dart:convert';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foody/dao/cartDAO.dart';
import 'package:flutter_foody/database/db_helper.dart';
import 'package:flutter_foody/entity/cart.dart';
import 'package:flutter_foody/firstPage.dart';
import 'package:flutter_foody/model/ItemChoice.dart';
import 'package:flutter_foody/model/dataMakanan.dart';
import 'package:flutter_foody/secondPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  List<Map<String, dynamic>> allData = [];
  List<Map<String, dynamic>> allDataNotCashier = [];
  List<BluetoothDevice> device = [];
  BluetoothDevice? selectedDevice;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  int _selectedChoiceIndex = -1;
  String _selectedLabel = '';
  String payment = "";
  int nomorNota = 0;

  void _onChipSelected(int index, String label) {
    setState(() {
      _selectedChoiceIndex = index;
      _selectedLabel = label;
      payment = label;
    });
  }

  // late CartDAO dao;

  // void saveNumberReceipt() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setInt("nomor", 0);
  // }

  // Future<int> getNumber() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getInt("nomor") ?? 0;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
    getDevice();
    fetchInvoiceNumber();
  }

  void getDevice() async {
    device = await printer.getBondedDevices();
    setState(() {});
  }

  void refreshData() async {
    final data = await SQLHelper.getAllData();
    final dataNotCashier = await SQLHelper.getAllDataNotCashier();
    setState(() {
      allData = data;
      allDataNotCashier = dataNotCashier;
    });
  }

  Future<void> insertTransaction(String nomorNota, String food, int price,
      String paymentMethod, String cashier, String date) async {
    await SQLHelper.insertTransaction(
        nomorNota, food, price, paymentMethod, cashier, date);
  }

  Future<void> deleteCart() async {
    await SQLHelper.deleteAllCart();
  }

  Future<int> getNextInvoiceNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentNumber = prefs.getInt('invoice_number') ?? 0;
    int nextNumber = currentNumber + 1;
    await prefs.setInt('invoice_number', nextNumber);
    return nextNumber;
  }

  Future<void> fetchInvoiceNumber() async {
    int number = await getNextInvoiceNumber();
    setState(() {
      nomorNota = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int harga = widget.dataMakanan.harga;

    List<Map<String, dynamic>> allFood = [];
    List<Map<String, dynamic>> allQty = [];
    int id = 0;
    String makanan = "";
    int harga = 0;
    int qty = 0;
    int subTotal = 0;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Foody',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color(0xffffb300),
        ),
        // body: StreamBuilder(
        //   stream: dao.getAllCart(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return Text("${snapshot.error}");
        //     } else if (snapshot.hasData) {
        //       var listCart = snapshot.data as List<Cart>;
        //       return ListView.builder(
        //         itemCount: listCart != null ? listCart.length : 0,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             child: ListTile(
        //               title: Text(listCart[index].nameFood +
        //                   "\n" +
        //                   listCart[index].price.toString() +
        //                   "\n" +
        //                   listCart[index].qty.toString() +
        //                   "\n"),
        //               subtitle: Text(listCart[index].cashier),
        //             ),
        //           );
        //         },
        //       );
        //     } else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
              child:
                  Text("Nomor Nota       C-MyProfit-" + nomorNota.toString()),
            ),

            Expanded(
                child: ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (context, index) {
                      final logger2 = Logger();
                      int price = allData[index]['price'];
                      int qty = allData[index]['qty'];
                      int total = price * qty;

                      // String jsonString2 =
                      //     '[{"id":1,"food":"Nasi Goreng","qty":2,"price":15000},{"id":2,"food":"Nasi Ayam Goreng","qty":1,"price":15000}]';

                      // List<Map<String, dynamic>> jsonData =
                      //     (json.decode(jsonString2) as List<dynamic>)
                      //         .cast<Map<String, dynamic>>();

                      // List<Cart> cart = [];

                      // logger2.d("FourthPage", jsonData.toString());

                      // jsonData.forEach((json) {
                      //   cart.add(Cart.fromJson(json));
                      // });

                      // cart.forEach((item) {
                      //   logger2.d("FourthPage", item.id);
                      //   logger2.d("FourthPage", item.nameFood);
                      //   logger2.d("FourthPage", item.price);
                      //   logger2.d("FourthPage", item.qty);

                      //   Fluttertoast.showToast(
                      //       msg: "${item.id}" +
                      //           "${item.nameFood}" +
                      //           "${item.price}" +
                      //           "${item.qty}",
                      //       toastLength: Toast.LENGTH_SHORT);

                      // logger2.d("FourthPage", item.cashier);
                      // });
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              allData[index]['food'],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          subtitle: Text(allData[index]['qty'].toString() +
                              " pcs @ " +
                              allData[index]['price'].toString()),
                          trailing: Text("Rp. " + total.toString()),
                        ),
                      );
                    })),
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: Text("Payment"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: Wrap(
                spacing: 8,
                children: <Widget>[
                  ChoiceChip(
                    label: Text('Cash'),
                    selected: _selectedChoiceIndex == 0,
                    selectedColor: Colors.amber,
                    onSelected: (bool selected) {
                      _onChipSelected(0, 'Cash');
                      // Fluttertoast.showToast(
                      //     msg: payment, toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                  ChoiceChip(
                    label: Text('Kredit'),
                    selected: _selectedChoiceIndex == 1,
                    selectedColor: Colors.amber,
                    onSelected: (bool selected) {
                      _onChipSelected(1, 'Kredit');
                      // Fluttertoast.showToast(
                      //     msg: payment, toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                  ChoiceChip(
                    label: Text('Debit'),
                    selected: _selectedChoiceIndex == 2,
                    selectedColor: Colors.amber,
                    onSelected: (bool selected) {
                      _onChipSelected(2, 'Debit');
                      // Fluttertoast.showToast(
                      //     msg: payment, toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                ],
                // children: listChoices
                //     .map((e) => ChoiceChip(
                //           // disabledColor: Colors.grey.shade300,
                //           // selectedColor: Colors.amber,
                //           label: Text(
                //             e.label,
                //             style: TextStyle(color: Colors.black),
                //           ),
                //           // selected: idSelected == e.id,
                //           selected: _isSelected,
                //           onSelected: (value) {
                //             payment = e.label;
                //             setState(() {
                //               // idSelected = value ? e.id : null;
                //               _isSelected = value;
                //             });
                //             // setState(() {
                //             //   // Fluttertoast.showToast(
                //             //   //     msg: e.label, toastLength: Toast.LENGTH_SHORT);
                //             //   idSelected = e.id;
                //             //   payment = e.label;
                //             // });
                //           },
                //         ))
                //     .toList(),
              ),
            ),

            // allData[index]['qty'] * allData[index]['price']
            // Text(widget.dataMakanan.nama),
            // Text("Rp. $harga"),
            // Text(widget.qty),
            // Text("C-MYPROFIT-$nomorNota"),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              height: 56,
              width: double.infinity,
              child: DropdownButton<BluetoothDevice>(
                value: selectedDevice,
                hint: const Text("Select Printer"),
                onChanged: (device) {
                  setState(() {
                    selectedDevice = device;
                  });
                },
                items: device
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name!),
                          value: e,
                        ))
                    .toList(),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffb300),
                ),
                onPressed: () {
                  printer.connect(selectedDevice!);
                },
                child: const Text(
                  "Connect",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            //   height: 56,
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xffffb300),
            //     ),
            //     onPressed: () {
            //       printer.disconnect();
            //     },
            //     child: const Text(
            //       "Disconnect",
            //       style: TextStyle(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffb300),
                ),
                onPressed: () async {
                  // int harga1 = widget.dataMakanan.harga;
                  // int qty1 = int.parse(widget.qty);
                  // int cetakHarga = qty1 * harga1;
                  final logger = Logger();

                  allFood = await SQLHelper.getAllFood();
                  allQty = await SQLHelper.getAllQty();

                  String xyz = allDataNotCashier.toString();

                  int index = allDataNotCashier.length;

                  // String jsonString = allDataNotCashier as String;
                  // Fluttertoast.showToast(
                  //     msg: jsonString, toastLength: Toast.LENGTH_SHORT);
                  // List<Map<String, dynamic>> jsonData = json.decode(jsonString);
                  // String makanan = "";

                  // for (var data in jsonData) {
                  //   makanan = data['food'];
                  // }

                  // JsonCodec codec = new JsonCodec();

                  // Map<String, dynamic> ab =
                  //     jsonEncode.decode(allDataNotCashier.toString());
                  // String abc = ab.values.toString();
                  String a = allFood.toString();
                  String b = allQty.toString();
                  DateTime now = new DateTime.now();
                  DateTime time = new DateTime(now.day, now.month, now.year,
                      now.hour, now.minute, now.second);

                  String dateFormat =
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

                  List<Map<String, dynamic>> cart = [];

                  // List<Map<String, dynamic>> jsonData =
                  //     (json.decode(jsonString) as List<dynamic>)
                  //         .cast<Map<String, dynamic>>();

                  // logger.d("FourthPage", jsonData.toString());

                  // List<Cart> cart = [];

                  // jsonData.forEach((json) {
                  //   cart.add(Cart.fromJson(json));
                  // });

                  // cart.forEach((item) {
                  //   logger.d("FourthPage", item.id);
                  //   logger.d("FourthPage", item.nameFood);
                  //   logger.d("FourthPage", item.price);
                  //   logger.d("FourthPage", item.qty);

                  //   id = item.id.toString();
                  //   makanan = item.nameFood;
                  //   harga = item.price.toString();
                  //   qty = item.qty.toString();

                  //   // Fluttertoast.showToast(
                  //   //     msg: "${item.id}" +
                  //   //         "${item.nameFood}" +
                  //   //         "${item.price}" +
                  //   //         "${item.qty}",
                  //   //     toastLength: Toast.LENGTH_SHORT);

                  //   // logger2.d("FourthPage", item.cashier);
                  // });

                  // Map<String, dynamic> map1 =
                  //     json.decode(responseData) as Map<String, dynamic>;
                  // Map<String, dynamic> map2 = jsonDecode(b);

                  // String food = map1['food'].toString();
                  // String qty = map2['qty'].toString();

                  ByteData bytesAsset =
                      await rootBundle.load("assets/interactive-1.png");
                  Uint8List imageBytesFromAsset = bytesAsset.buffer.asUint8List(
                      bytesAsset.offsetInBytes, bytesAsset.lengthInBytes);

                  if ((await printer.isConnected)!) {
                    //SIZE
                    //0 : NORMAL
                    //1 : NORMAL-BOLD
                    //2 : MEDIUM-BOLD
                    //3 : LARGE

                    //ALIGN
                    //0 : LEFT
                    //1 : CENTER
                    //2 : RIGHT

                    // printer.printImageBytes(imageBytesFromAsset);
                    printer.printCustom("TOKO ABCDE", 3, 1);
                    printer.printCustom("Jalan Belakang no 7", 0, 1);
                    printer.printCustom(
                        "================================", 0, 1);
                    printer.printNewLine();
                    printer.printCustom(
                        "Nomor Nota" + "   " + "C-MYPROFIT - $nomorNota", 0, 0);
                    printer.printCustom(
                        "Date " + "        " + dateFormat, 0, 0);
                    printer.printCustom("Kasir " + "       " + "Ryan", 0, 0);
                    printer.printCustom("Order Type " + "  " + "Dine-In", 0, 0);
                    printer.printCustom(
                        "================================", 0, 1);
                    // printer.printCustom("Item", 0, 0);
                    // printer.printCustom("Jumlah", 0, 1);
                    // printer.printCustom("Harga", 0, 2);
                    printer.printNewLine();

                    int idx = allDataNotCashier.length;
                    List<int> total = [];

                    for (var i = 0; i < idx; i++) {
                      id = allDataNotCashier[i]['id'];
                      makanan = allDataNotCashier[i]['food'];
                      harga = allDataNotCashier[i]['price'];
                      qty = allDataNotCashier[i]['qty'];
                      // subTotal += total[i];

                      printer.printCustom(makanan, 0, 0);
                      // printer.printCustom('${ab['food']}', 0, 0);
                      printer.print3Column(
                          "$qty x", "@$harga", "${qty * harga}", 0);
                      // printer.printCustom(qty.toString(), 0, 0);
                      total.add(qty * harga);
                    }

                    // total.forEach((value) {
                    //   Fluttertoast.showToast(
                    //         msg: total.toString(),
                    //         toastLength: Toast.LENGTH_SHORT);
                    //   subTotal += value;
                    // });

                    for (int i = 0; i < total.length; i++) {
                      subTotal += total[i];
                    }
                    printer.printCustom(
                        "================================", 0, 1);
                    // List<int> total = [];
                    // int subTotal = 0;
                    // for (var i = 0; i < idx; i++) {
                    //   total += allDataNotCashier[i]['price'] as List<int>;
                    //   subTotal += total[i];
                    // }
                    // printer.printCustom("Sub Total " + " " + subTotal.toString(), 0, 2);
                    // printer.printCustom("Sub Total " + subTotal.toString(), 0, 2); // output is the last price of item
                    printer.printCustom(
                        "Sub Total   " + subTotal.toString(), 0, 2);
                    printer.printCustom("Payment " + "  " + payment, 0, 2);
                    printer.printCustom(
                        "================================", 0, 1);
                    printer.printCustom("*** Thank You ***", 0, 1);
                    // printer.printCustom(id.toString(), 0, 0);
                    // printer.printCustom(makanan, 0, 0);
                    // // printer.printCustom('${ab['food']}', 0, 0);
                    // printer.printCustom(harga.toString(), 0, 0);
                    // printer.printCustom(qty.toString(), 0, 0);
                    // printer.printCustom("Rp. $cetakHarga", 0, 2);
                    printer.printNewLine();
                    printer.printNewLine();
                  }
                },
                child: const Text(
                  "Print",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffb300),
                ),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  String dateFormat =
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                  int idx = allDataNotCashier.length;
                  List<int> subTotal = [];
                  List<String> item = [];
                  int insertTotal = 0;
                  for (var i = 0; i < idx; i++) {
                    makanan = allDataNotCashier[i]['food'];
                    harga = allDataNotCashier[i]['price'];
                    qty = allDataNotCashier[i]['qty'];
                    subTotal.add(qty * harga);
                    item.add(makanan);
                  }
                  for (int i = 0; i < subTotal.length; i++) {
                    insertTotal += subTotal[i];
                  }
                  await insertTransaction(
                      "C-MYPROFIT-$nomorNota",
                      item.toString(),
                      insertTotal,
                      payment,
                      "Ryan",
                      dateFormat);
                  await deleteCart();

                  // await delete
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const SecondPage('')),
                      (route) => false);
                  // Navigator.pop(
                  //   context,
                  // );
                },
                child: const Text(
                  "New Order",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
