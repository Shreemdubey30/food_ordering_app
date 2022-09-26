import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordring/auth/login%20as%20customer.dart';
import 'package:food_ordring/auth/login%20as%20vendor.dart';
import 'package:food_ordring/view/customer/cretate_profile.dart';
import 'package:food_ordring/view/vendor/vendor_dashboard.dart';

import '../components/custom_button.dart';
import '../constants/color_constants.dart';
import '../main.dart';
import '../view/customer/customer_dashboard.dart';
import '../view/customer/profile_screen.dart';

class LoginAsVendor extends StatefulWidget {
  const LoginAsVendor({Key? key}) : super(key: key);

  @override
  State<LoginAsVendor> createState() => _LoginAsVendorState();
}

class _LoginAsVendorState extends State<LoginAsVendor> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 275,
                  padding: EdgeInsets.all(50),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[kOrange, kYellow],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            width: 150,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //       image: AssetImage(
                            //           "assets/images/ManagoLogo.png"),
                            //       fit: BoxFit.contain),
                            // ),
                          ),
                        ),
                        Text(
                          'Food Ordering App',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Login as a Vendor',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Enter your Email ID ',
                      style: TextStyle(fontSize: 15, color: kGreyFont),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Form(
                //  key: _formKey,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                              labelText: 'email',
                              labelStyle: TextStyle(color: Colors.black)),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black)),
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              CustomButton(
                                title: 'Login',
                                onPressed: () async {
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    try {
                                      _auth
                                          .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                          .then((value) => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VendorDashboard()))
                                      });
                                    } catch (e) {
                                      print("invalid Login");
                                    }
                                  } else {
                                    print("Error");
                                  }
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return CreateProfileCustomer();
                                                }));
                                      },
                                      child: Text(
                                        "Create Account",
                                        style: TextStyle(
                                            color: kOrange,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return LoginAsCustomer();
                                                }));
                                      },
                                      child: Text(
                                        "Customer Login",
                                        style: TextStyle(
                                            color: kOrange,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
