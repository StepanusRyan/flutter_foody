import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foody/dao/cartDAO.dart';

import 'package:flutter_foody/firstPage.dart';

import 'database/database.dart';

// import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final database =
//       await $FloorAppDatabase.databaseBuilder("prototype.db").build();
//   final dao = database.cartDao;

//   runApp(MyApp(dao));
// }

class MyApp extends StatelessWidget {
  // final CartDAO dao;
  // const MyApp(this.dao);
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Foody';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      // home: FirstPage(dao: dao),
      home: FirstPage(),
    );
  }
}

//FirstPage


//SecondPage


//ThirdPage





// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget cancelButton = Material(
//       child: TextButton(
//     child: Text("Cancel"),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   ));
//   Widget continueButton = Material(
//       child: TextButton(
//           child: Text("Continue"),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => FourthPage(data)));
//           }));
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("AlertDialog"),
//     content:
//         Text("Would you like to continue learning how to use Flutter alerts?"),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
