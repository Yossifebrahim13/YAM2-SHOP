import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/AboutUs.dart';
import 'package:flutter_app1/AccountAndSetting.dart';
import 'package:flutter_app1/AuthenticationPage.dart';
import 'package:flutter_app1/Shop.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  double infoopacity = 1;
  double projctopacity = 0;
  double subprojctopacity = 0;
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
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(15),
          child: Center(
            child: Text(
              "YAM2",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            infoopacity = 0;
            projctopacity = 1;
            subprojctopacity = 1;
            setState(() {});
          },
          onDoubleTap: () {
            infoopacity = 1;
            projctopacity = 0;
            subprojctopacity = 0;
            setState(() {});
          },
          child: Center(
            child: Text(
              "Yossif Ebrahim",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AnimatedOpacity(
          opacity: infoopacity,
          duration: Duration(seconds: 2),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Phone :  01121966567",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.phone)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "GitHup :  https://github.com/Yossifebrahim13",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.code, color: Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "LinkedIn : ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "https://www.linkedin.com/in/yossif-ebrahim-56b0142b6",
                        style: TextStyle(fontSize: 13),
                      ),
                      Icon(
                        Icons.link,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Email :  yossifebrahim76@gmail.com",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.alternate_email_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: projctopacity,
              duration: Duration(seconds: 3),
              child: Container(
                child: Text(
                  "This Is My First Project",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: subprojctopacity,
              duration: Duration(seconds: 4),
              child: Container(
                child: Text(
                  "Using Dart & Flutter",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
