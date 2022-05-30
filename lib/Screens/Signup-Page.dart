import "package:flutter/material.dart";
import 'package:shopobae/Screens/Login-Page.dart';
import 'package:shopobae/Widgets.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextStyle1("Signup Page", 30, Colors.black, FontWeight.bold,
                  TextAlign.center, FontStyle.normal),
              Space(20),
              Textfield1(
                  "Email",
                  "Enter your email",
                  15,
                  Colors.black,
                  FontWeight.normal,
                  TextAlign.center,
                  FontStyle.normal,
                  "asset/Email.png"),
              Space(20),
              TextfieldPassword(
                  "Password",
                  "Enter your Password",
                  15,
                  Colors.black,
                  FontWeight.normal,
                  TextAlign.center,
                  FontStyle.normal,
                  "asset/Key.png",
                      () {},
                  true),
              Space(20),
              Button1("Sign Up", 18, Color(0xBFABABAB), FontWeight.normal,
                  TextAlign.center, FontStyle.normal, () {}, context),
              Space(20),
              TextButton1(
                      () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));},
                  "Already have an account?Login",
                  18,
                  Color(0xBFABABAB),
                  FontWeight.normal,
                  TextAlign.center,
                  FontStyle.normal)
            ],
          ),
        ),
      ),
    );
  }
}
