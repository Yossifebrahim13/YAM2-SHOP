import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/AboutUs.dart';
import 'package:flutter_app1/AccountAndSetting.dart';
import 'package:flutter_app1/AuthenticationPage.dart';
import 'package:flutter_app1/ContactUs.dart';
import 'package:flutter_app1/Shop.dart';

class ItemsDetails extends StatefulWidget {
  const ItemsDetails({super.key, this.itemdata});
  final itemdata;
  @override
  State<ItemsDetails> createState() => _MyItemsDetails();
}

class _MyItemsDetails extends State<ItemsDetails> {
  GlobalKey<ScaffoldState> bottomsheetkey = GlobalKey();
  String? productcolor;
  int buttomindex = 0;
  int item = 0;
  void additem() => item++;
  void removeitem() => item--;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: bottomsheetkey,
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
          Image.asset(widget.itemdata["image"]),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              widget.itemdata["title"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              widget.itemdata["subtitle"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            child: Text(
              widget.itemdata["price"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.orange[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  "Version : ",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Text(
                "Premium",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Classic",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black,
              onPressed: () {
                bottomsheetkey.currentState!.showBottomSheet((context) =>
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
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
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Text(
                                    widget.itemdata["title"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    widget.itemdata["subtitle"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 10),
                                  child: Text(
                                    " Price : ${widget.itemdata["price"]}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.orange[800],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            MaterialButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Confirm payment"),
                                    action: SnackBarAction(
                                        label: "pay", onPressed: () {}),
                                    duration: Duration(seconds: 3),
                                  ));
                                },
                                child: Container(
                                    width: 100,
                                    height: 50,
                                    color: Colors.black,
                                    child: Center(
                                      child: Text(
                                        "PAY NOW",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    )))
                          ],
                        ),
                      ),
                    ));
              },
              child: const Text(
                "ADD TO CART",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
