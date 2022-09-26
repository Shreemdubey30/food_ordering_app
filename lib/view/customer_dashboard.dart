import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordring/view/order_screen.dart';
import 'package:food_ordring/view/profile_screen.dart';

import '../constants/color_constants.dart';
import 'customer_home.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      CustomerHome(),
      OrderScreen(),
      ProfileScreen(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text("Food Delivery App"),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kOrange,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          onTap: (indexValue) {
            setState(() {
              currentIndex = indexValue;
            });
          },
          unselectedFontSize: 9,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
