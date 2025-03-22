import 'package:flutter/material.dart';
import 'package:flutter_app1/HomePage.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogin = true;

  // Animation variabls...
  late AnimationController animationController;
  late Animation<AlignmentGeometry> alignmentGeometry;
  late Animation<double> rotatecontroller;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    alignmentGeometry = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(animationController);
    rotatecontroller =
        Tween<double>(begin: 0, end: 2).animate(animationController);
    super.initState();
  }
  @override
void dispose() {
  animationController.dispose(); 
  super.dispose();
}


  void _authenticate() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    if (isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logged in as: $email") , duration: Duration(seconds: 1),),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account created for: $email"), duration: Duration(seconds: 1),),
      );
    }
  }

  //under building.........
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? "Login" : "Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              AlignTransition(
                  alignment: alignmentGeometry,
                  child: RotationTransition(
                    turns: rotatecontroller,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
              SizedBox(
                height: 75,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.orange, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                cursorColor: Colors.orange[700],
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                cursorColor: Colors.orange[700],
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  _authenticate();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage()));
                },
                child: Text(
                  isLogin ? "Login" : "Sign Up",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                    isLogin
                        ? "Create an account"
                        : "Already have an account? Login",
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
