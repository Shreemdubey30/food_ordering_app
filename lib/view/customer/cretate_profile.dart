import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordring/auth/login%20as%20customer.dart';
import 'package:food_ordring/components/custom_button.dart';

import '../../constants/color_constants.dart';

class CreateProfileCustomer extends StatefulWidget {
  const CreateProfileCustomer({Key? key}) : super(key: key);

  @override
  State<CreateProfileCustomer> createState() => _CreateProfileCustomerState();
}

class _CreateProfileCustomerState extends State<CreateProfileCustomer> {
  final _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              'Food Delivery',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  // CircleImage(),
                  SizedBox(
                    height: 20,
                  ),

                  //TODO: Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.black)),
                            controller: nameController,
                            keyboardType: TextInputType.text,
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          //TODO: email
                          TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email Id',
                                labelStyle: TextStyle(color: Colors.black)),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),

                          SizedBox(height: 30),
                          TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.password),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black)),
                            keyboardType: TextInputType.emailAddress,
                            controller: passwordController,
                          ),

                          SizedBox(height: 30),

                          CustomButton(
                              title: "Create Profile",
                              onPressed: () async {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  await _auth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginAsCustomer()));
                                } else {
                                  print("Error");
                                }
                              }),
                          CustomButton(
                              title: "Back",
                              onPressed: () async {
                                Navigator.pop(context);
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
