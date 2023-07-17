import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foody/dao/cartDAO.dart';
import 'package:flutter_foody/database/db_helper.dart';
import 'package:flutter_foody/model/Menu.dart';
import 'package:flutter_foody/model/dataMakanan.dart';
import 'package:flutter_foody/secondPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  // const FirstPage({super.key, required this.dao});
  const FirstPage({super.key});

  // final CartDAO dao;

  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirstPage> {
  late Future<Menu> _usersFuture;

  Future<void> addDataMenuToSQL(String name, String image, int price) async {
    await SQLHelper.insertMenu(name, image, price);
  }

  // Future<List<dynamic>> fetchUsers() async {
  //   final response = await http.get(Uri.parse(
  //       "https://run.mocky.io/v3/2334a905-8b20-484a-903f-54d75801123f"));
  //
  //   // String a;
  //
  //   // data.forEach((element) {
  //   //   a = data[element].toString();
  //   // });
  //
  //   // final jsonData = jsonDecode(response.body);
  //   // final data = (jsonData['data'])
  //
  //   return json
  //       .decode(response.body)['data']; // api tidak terdapat variable data
  // }

  @override
  void initState() {
    // _usersFuture = fetchUsers();
    super.initState();
  }

  List<Map<String, dynamic>> inputMenu = [];
  String name = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Foody",
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Foody",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color(0xffffb300),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // FutureBuilder<List<dynamic>>(
                  //   future: fetchUsers(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       // int i;
                  //       // List<dynamic> menus = [];
                  //       // menus.add(snapshot.data!);
                  //       // for (i = 0; i < menus.length; i++) {
                  //       //   // Fluttertoast.showToast(
                  //       //   //     msg: snapshot.data.toString(),
                  //       //   //     toastLength: Toast.LENGTH_LONG);
                  //       //   Fluttertoast.showToast(
                  //       //       msg: i.toString(),
                  //       //       toastLength: Toast.LENGTH_LONG);
                  //       //   // return ListTile(
                  //       //   //     // title: Text(snapshot.data![i]['name']));
                  //       //   //     title: Text(i.toString()));
                  //       //   // return Text(snapshot.data![i]['name']);
                  //       //   return Text(i.toString());
                  //       // }

                  //       // return ListView.builder(
                  //       //     itemCount: snapshot.data?.length,
                  //       //     itemBuilder: (context, index) {
                  //       //       return Text(snapshot.data![1]['name']);
                  //       //     });
                  //     } else if (snapshot.hasError) {
                  //       return Text("${snapshot.error}");
                  //     }
                  //     return const CircularProgressIndicator();
                  //   },
                  // ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 256, 16, 16),
                    child: TextField(
                      onChanged: (String value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffffb300)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffffb300))),
                        hintText: 'Enter your name',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffffb300),
                      ),
                      onPressed: () async {
                        for (int i = 0; i < listDataMakanan.length; i++) {
                          await addDataMenuToSQL(
                              listDataMakanan[i].nama,
                              listDataMakanan[i].image,
                              listDataMakanan[i].harga);
                        }

                        // final DataMakanan food = listDataMakanan[3];
                        // await addDataMenuToSQL(
                        //     food.nama, food.image, food.harga);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage(name)));
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
