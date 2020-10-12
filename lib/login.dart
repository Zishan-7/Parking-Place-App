import 'package:flutter/material.dart';
import 'package:hotel_booking/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: non_constant_identifier_names
  bool Signin_form = true;
  String email, password;
  Widget signin() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 1.0,
          spreadRadius: 1.0,
          offset: Offset(1, 4), // shadow direction: bottom right
        ),
      ]),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.65,
      width: 415, //MediaQuery.of(context).size.width * 0.3,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              googleSignIn().whenComplete(() async {
                User user = FirebaseAuth.instance.currentUser;

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Home(uid: user.uid)));
              });
              /*.then((value) {
                if (value != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                }
              });*/
            },
            child: Text(
              "Sign-in With google",
              style: TextStyle(color: Colors.cyan[600]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text("Sign-in",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              onChanged: (_val) {
                email = _val;
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.black87),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: TextField(
              onChanged: (_val) {
                password = _val;
              },
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.black87),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: RaisedButton(
                onPressed: () {
                  signIn(email.trim(), password, context).then((value) {
                    if (value != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(uid: value.uid),
                          ));
                    }
                  });
                  /*whenComplete(() =>
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home())));*/
                },
                color: Colors.cyan[600],
                padding:
                    EdgeInsets.only(left: 150, right: 150, top: 20, bottom: 20),
                child: Text("LOGIN",
                    style: TextStyle(fontSize: 15, color: Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Forgot Pasword?",
                style: TextStyle(color: Colors.cyan[600]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?  ",
                style: TextStyle(fontSize: 15),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Signin_form = false;
                  });
                },
                child: Text("Sign up",
                    style: TextStyle(fontSize: 15, color: Colors.blue[600])),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget signup() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.slowMiddle,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 1.0,
          spreadRadius: 1.0,
          offset: Offset(1, 4), // shadow direction: bottom right
        ),
      ]),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.65,
      width: 415, //MediaQuery.of(context).size.width * 0.3,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text("Create Your Account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.black87),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              onChanged: (val) {
                email = val;
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.black87),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: TextField(
              onChanged: (val) {
                password = val;
              },
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.black87),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 15),
            child: RaisedButton(
                onPressed: () {
                  signUp(email, password, context).then((value) {
                    if (value != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(uid: value.uid),
                          ));
                    }
                  });
                },
                color: Colors.red,
                padding:
                    EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 20),
                child: Text("GET STARTED!",
                    style: TextStyle(fontSize: 15, color: Colors.white))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already a member?  ",
                style: TextStyle(fontSize: 15),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Signin_form = true;
                  });
                },
                child: Text("Sign In",
                    style: TextStyle(fontSize: 15, color: Colors.red)),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.red[300],
            child: Image.asset(
              "assets/Images/bg.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.black.withOpacity(0.7),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Signin_form ? "Welcome Back" : "Welcome",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    Signin_form
                        ? "Please login to access your account"
                        : "Become a Member. Its Free!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: //Signin_form ? signin() : signup()
                      AnimatedSwitcher(
                    transitionBuilder:
                        (Widget child, Animation<double> animation) =>
                            ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    duration: Duration(milliseconds: 800),
                    child: Signin_form ? signin() : signup(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              onTap: () {},
              child: Text("WEBSITE NAME \nOR LOGO",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
