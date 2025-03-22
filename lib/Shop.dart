import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/AboutUs.dart';
import 'package:flutter_app1/AccountAndSetting.dart';
import 'package:flutter_app1/AuthenticationPage.dart';
import 'package:flutter_app1/ContactUs.dart';
import 'package:flutter_app1/details.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _MyShopPage();
}

class _MyShopPage extends State<ShopPage> {
  List allproduct = [
    {
      "image": "images/smartwatch.jpg",
      "title": "Smart Watch",
      "subtitle": "Smart Watch T800",
      "price": "350\$"
    },
    {
      "image": "images/airpods.jpg",
      "title": "Air Pods",
      "subtitle": "Araimo Air Pods",
      "price": "299\$"
    },
    {
      "image": "images/scooter.jpg",
      "title": "Scooter",
      "subtitle": "Electric Scooter",
      "price": "1200\$"
    },
    {
      "image": "images/camera.jpg",
      "title": "Camera",
      "subtitle": "Camera Sony 2000",
      "price": "5000\$"
    },
    {
      "image": "images/camera2.png",
      "title": "Camera",
      "subtitle": "Camera Sony 2100",
      "price": "6000\$"
    },
    {
      "image": "images/laptop.png",
      "title": "Laptop",
      "subtitle": "Laptop lenovo",
      "price": "4500\$"
    },
    {
      "image": "images/pc.png",
      "title": "PC",
      "subtitle": "PC",
      "price": "6800\$"
    },
    {
      "image": "images/phone.png",
      "title": "Phone",
      "subtitle": "Samsung A23",
      "price": "1200\$"
    },
    {
      "image": "images/taplet.png",
      "title": "TapLet",
      "subtitle": "Samsung A6",
      "price": "900\$"
    },
    {
      "image": "images/smartwatch2.png",
      "title": "Smart Watch",
      "subtitle": "Smart Watch T1200",
      "price": "800\$"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shop_2_outlined),
            const Text("YAM2",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            Text("SHOP",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.orange[800])),
          ],
        ),
      ),
      endDrawer: Drawer(
        elevation: 200,
        shadowColor: Colors.orange[900],
        backgroundColor: Colors.grey[200],
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        "images/photo_2025-01-16_22-40-59.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Expanded(
                      child: ListTile(
                    title: Text("Yossif Ebrahim"),
                    subtitle: Text("yossifebrahim@gmail.com"),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  "Account & Setting",
                  style: TextStyle(fontSize: 18),
                ),
                leading: const Icon(Icons.account_circle_outlined),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AccountSettingsScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  "Shop",
                  style: TextStyle(fontSize: 18),
                ),
                leading: const Icon(Icons.shopping_cart_outlined),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ShopPage()));
                },
              ),
              ListTile(
                title: const Text(
                  "About Us",
                  style: TextStyle(fontSize: 18),
                ),
                leading: const Icon(Icons.person_2_outlined),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AboutUsPage()));
                },
              ),
              ListTile(
                title: const Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 18),
                ),
                leading: const Icon(Icons.phone),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ContactUs()));
                },
              ),
              ListTile(
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                ),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.scale,
                    title: 'Warning...',
                    desc: 'Do You Want To Logout',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => AuthenticationPage()),
                        (route) => false,
                      );
                    },
                  )..show();
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shop_2_outlined),
                  const Text("YAM2",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                  Text("SHOP",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.orange[800])),
                ],
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          GridView.builder(
            itemCount: allproduct.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 250),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ItemsDetails(itemdata: allproduct[index])));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 300,
                        color: Colors.grey[100],
                        child: Image.asset(
                          allproduct[index]["image"],
                          fit: BoxFit.fill,
                          height: 120,
                        ),
                      ),
                      Text(
                        allproduct[index]["title"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 2,
                      ),
                      Text(
                        allproduct[index]["subtitle"],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      Container(
                        height: 6,
                      ),
                      Text(
                        allproduct[index]["price"],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange[800],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
