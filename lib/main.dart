import 'package:flutter/material.dart';
import 'package:flutter_app1/AuthenticationPage.dart';
import 'package:flutter_app1/HomePage.dart';
import 'package:flutter_app1/AboutUs.dart';
import 'package:flutter_app1/Shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedindex = 0;
  // still building ....
  final List<Widget> navigationbar = [
    const HomePage(),
    const ShopPage(),
    const AboutUsPage()
  ];
  // this function organize which page open
  void onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "Athentication": (context) => AuthenticationPage(),
      },
      theme: ThemeData(
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              headlineLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
      home: Scaffold(
        body: navigationbar[selectedindex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedindex,
            iconSize: 30,
            selectedItemColor: Colors.orange[700],
            onTap: onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outlined), label: ""),
            ]),
      ),
    );
  }
}
