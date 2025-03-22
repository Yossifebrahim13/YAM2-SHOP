import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/AccountAndSetting.dart';
import 'package:flutter_app1/AuthenticationPage.dart';
import 'package:flutter_app1/ContactUs.dart';
import 'package:flutter_app1/Shop.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});
  @override
  State<AboutUsPage> createState() => _AboutUsPage();
}

class _AboutUsPage extends State<AboutUsPage> {
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
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Image.asset(
                          "images/photo_2025-01-16_22-40-59.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListTile(
                      title: Text(
                        "Yossif Ebrahim",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text("yossifebrahim@gmail.com"),
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "ABOUT",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "US",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.orange,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    """YAM2 is your go-to destination for online shopping, offering high-quality products at great prices.We strive to make your experience seamless and enjoyable with excellent customer service, fast shipping, and secure payment options.Whether you're looking for the latest trends or everyday essentials, YAM2 has everything you need in one place.""",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Shop smart. Shop easy. Shop ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "YAM2.",
                      style: TextStyle(fontSize: 20, color: Colors.orange),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Icon(
                    Icons.shop_2_outlined,
                    size: 50,
                    color: Colors.orange,
                    shadows: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 2)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("© 2025 YAM2. Made By Yossif Ebrahim."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
