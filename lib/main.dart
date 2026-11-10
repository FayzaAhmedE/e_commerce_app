import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/screens/upate_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        HomePage.id :(context) => HomePage(),
        UpateProductPage.id:(context) => UpateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
