import "package:flutter/material.dart";
import 'package:shopobae/Screens/Home-Page.dart';
import 'package:shopobae/Screens/Product-Page.dart';
import 'package:shopobae/Screens/Signup-Page.dart';
import 'package:shopobae/Widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextStyle1("Login Page", 30, Colors.black, FontWeight.bold,
                  TextAlign.center, FontStyle.normal),
              Space(20),
              DropDownList((
                dynamic newValue,
              ) {
                setState(() {
                  dropdownvalue = newValue;
                });
              }, context),
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
                  "asset/Key.png", () {

              }, true),
              Space(20),
              Button1("Login", 18, Color(0xBFABABAB), FontWeight.normal,
                  TextAlign.center, FontStyle.normal, () {
                if (dropdownvalue.toString() == "Consumer") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else if (dropdownvalue.toString() == "Seller") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                  }}, context),
              Space(20),
              TextButton1(() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupPage()));
              }, "Don't have an Account?Signup", 18, Color(0xBFABABAB),
                  FontWeight.normal, TextAlign.center, FontStyle.normal)
            ],
          ),
        ),
      ),
    );
  }
}
