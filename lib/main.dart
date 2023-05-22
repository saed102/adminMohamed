import 'dart:io';

import 'package:ahmed_store_admin/views/screens/main_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/categories_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/orders_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/products_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/widgets/banner_widget.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/widgets/vendor_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ? FirebaseOptions(
              apiKey: "AIzaSyDlR2JzRuX_J4v9HAE9ZFjQob3iE6BS5II",
              appId: "1:788490919546:web:7417825bf2bb20d0d5a5c3",
              messagingSenderId: "788490919546",
              projectId: "ahmed-store-21b4c",
              storageBucket: "ahmed-store-21b4c.appspot.com",
            )
          : null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),

      //      builder: EasyLoading.init(),
    );
  }
}

class NAME extends StatelessWidget {
  const NAME({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: InkWell(
            onTap: () async {
              final FirebaseFirestore _firestore = FirebaseFirestore.instance;

              await _firestore
                  .collection('categories')
                  .get()
                  .then((value){

                    value.docs.forEach((element) {
                      print(element.data());
                    });
              });
            },
            child: Center(child: Text("data",style: TextStyle(color: Colors.red),))),
      ),
    );
  }
}
