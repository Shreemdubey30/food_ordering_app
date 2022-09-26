import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordring/auth/login%20as%20customer.dart';
import 'package:food_ordring/view/cretate_profile.dart';
import 'package:food_ordring/view/customer_dashboard.dart';

import 'auth/login as vendor.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: CustomerDashboard()));
  }
}
