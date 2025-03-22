import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/AboutUs.dart';
import 'package:flutter_app1/AccountAndSetting.dart';
import 'package:flutter_app1/AuthenticationPage.dart';
import 'package:flutter_app1/ContactUs.dart';
import 'package:flutter_app1/Shop.dart';
import 'package:flutter_app1/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> {
  GlobalKey<ScaffoldState> drawerkey = GlobalKey();

  List product = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: drawerkey,
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
        body: Container(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: ListView(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                        hintText: "search",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                        )),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () {
                          drawerkey.currentState!.openEndDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                        )),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              const Text("Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Container(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.laptop),
                            iconSize: 30,
                          ),
                        ),
                        Text(
                          "Laptop",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.phone_android),
                            iconSize: 30,
                          ),
                        ),
                        Text(
                          "Phone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_outlined),
                            iconSize: 30,
                          ),
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.electric_bolt),
                            iconSize: 30,
                          ),
                        ),
                        Text(
                          "Electric Devices",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.electric_scooter_rounded),
                            iconSize: 30,
                          ),
                        ),
                        Text(
                          "Scooter",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.wallet_giftcard),
                            iconSize: 30,
                          ),
                        ),
                        Text(
                          "Gifts",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: const Text("Best Selling",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              GridView.builder(
                itemCount: product.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ItemsDetails(itemdata: product[index])));
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
                              product[index]["image"],
                              fit: BoxFit.fill,
                              height: 120,
                            ),
                          ),
                          Text(
                            product[index]["title"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 2,
                          ),
                          Text(
                            product[index]["subtitle"],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          Container(
                            height: 6,
                          ),
                          Text(
                            product[index]["price"],
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
        ));
  }
}
