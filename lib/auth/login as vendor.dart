import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/custom_button.dart';
import '../constants/color_constants.dart';
import '../main.dart';

class LoginAsVendor extends StatefulWidget {
  const LoginAsVendor({Key? key}) : super(key: key);

  @override
  State<LoginAsVendor> createState() => _LoginAsVendorState();
}

class _LoginAsVendorState extends State<LoginAsVendor> {
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
                          // validator: (mobile) {
                          //   if (mobile.isEmpty) {
                          //     return 'Mobile no. is required.';
                          //   } else if (mobile.length != 10) {
                          //     return 'Mobile no. should be of 10 digits.';
                          //   }
                          //   return null;
                          // },
                          style: TextStyle(fontSize: 14),
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9+]"))
                          ],
                          decoration: InputDecoration(
                              prefixText: '  ',
                              contentPadding: EdgeInsets.all(15),
                              hintText: 'Enter Email ID',
                              hintStyle: TextStyle(color: kGreyFont),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: kGreyBackground)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kGreyBackground),
                                  borderRadius: BorderRadius.circular(10))),
                          onChanged: (value) {
                            //_con.mobile = "$value";
                          },
                          // maxLength: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // validator: (mobile) {
                          //   if (mobile.isEmpty) {
                          //     return 'Mobile no. is required.';
                          //   } else if (mobile.length != 10) {
                          //     return 'Mobile no. should be of 10 digits.';
                          //   }
                          //   return null;
                          // },
                          style: TextStyle(fontSize: 14),
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9+]"))
                          ],
                          decoration: InputDecoration(
                              prefixText: '  ',
                              contentPadding: EdgeInsets.all(15),
                              hintText: 'Enter Your Password',
                              hintStyle: TextStyle(color: kGreyFont),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: kGreyBackground)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kGreyBackground),
                                  borderRadius: BorderRadius.circular(10))),
                          onChanged: (value) {
                            //_con.mobile = "$value";
                          },
                          // maxLength: 10,
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              CustomButton(
                                title: 'Login',
                                onPressed: () async {},
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // TextButton(
                                  //     onPressed: () {
                                  //       Navigator.push(context,
                                  //           MaterialPageRoute(
                                  //               builder: (context) {
                                  //         return MyApp();
                                  //       }));
                                  //     },
                                  //     child: Text(
                                  //       "Login as Vendor ➤",
                                  //       style: TextStyle(
                                  //           color: kOrange,
                                  //           fontWeight: FontWeight.bold),
                                  //     )),
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
