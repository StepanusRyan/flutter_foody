import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_foody/database/db_helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> allDataTransaction = [];

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() async {
    final data = await SQLHelper.getAllDataTransactions();
    final dataNotCashier = await SQLHelper.getAllDataNotCashier();
    setState(() {
      allDataTransaction = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "History Transaction",
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "History Transaction" + " (${allDataTransaction.length})",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Color(0xffffb300),
          ),
          body: Center(
            child: ListView.builder(
              itemCount: allDataTransaction.length,
              itemBuilder: (context, index) {
                String item = allDataTransaction[index]['food'];
                String food = item.replaceAll(new RegExp(r'[\[\]]'), '');
                // int qty = allDataTransaction[index]['food'];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        allDataTransaction[index]['no_nota'],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    subtitle:
                        // Text(allDataTransaction[index]['food'].toString()),
                        Text(food),
                    trailing:
                        Text("Rp. ${allDataTransaction[index]['subTotal']}"),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
