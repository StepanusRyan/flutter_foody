import 'package:flutter/material.dart';
import 'package:flutter_foody/database/db_helper.dart';
import 'package:flutter_foody/fourthPage.dart';
import 'package:flutter_foody/historyPage.dart';
import 'package:flutter_foody/main.dart';
import 'package:flutter_foody/model/dataMakanan.dart';
import 'package:flutter_foody/thirdPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dao/cartDAO.dart';

class SecondPage extends StatefulWidget {
  final String names;
  const SecondPage(this.names, {Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Map<String, dynamic>> allData = [];

  Future<void> getDataMenu() async {
    await SQLHelper.getAllMenu();
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() async {
    final data = await SQLHelper.getAllMenu();
    setState(() {
      allData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Foody" " (${allData.length})",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(),
                    ));
              },
              icon: Icon(Icons.history)),
        ],
        backgroundColor: const Color(0xffffb300),
      ),
      body: ListView.builder(
        itemCount: allData.length,
        itemBuilder: (context, index) {
          print(index);
          int harga = allData[index]['price'];
          String foodName = allData[index]['name'];
          String image = allData[index]['image'];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ThirdPage(foodName, image, harga, widget.names);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          allData[index]['image'],
                          // food.image,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            allData[index]['name'],
                            // food.nama,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Rp. $harga"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

          // final DataMakanan food = listDataMakanan[index];
          // int harga = food.harga;
          // return InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return ThirdPage(food, widget.names);
          //     }));
          //   },
          //   child: Card(
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Expanded(
          //             flex: 1,
          //             child: Container(
          //               color: Colors.transparent,
          //               width: 100,
          //               height: 100,
          //               padding: EdgeInsets.all(4),
          //               child: Image.asset(
          //                 food.image,
          //                 fit: BoxFit.cover,
          //               ),
          //             )),
          //         Expanded(
          //           flex: 2,
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Text(
          //                   food.nama,
          //                   style: const TextStyle(fontSize: 16.0),
          //                 ),
          //                 const SizedBox(
          //                   height: 10,
          //                 ),
          //                 Text("Rp. $harga"),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FourthPage();
          }));
          // Fluttertoast.showToast(
          //     msg: "Ini Checkout", toastLength: Toast.LENGTH_SHORT);
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => FourthPage("dataMakanan,qty,names")));
        },
        label: Text("Checkout"),
      ),
    );
  }
}
