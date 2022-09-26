import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordring/view/customer/profile_screen.dart';
import 'package:food_ordring/view/vendor/vendor_home.dart';

import '../../constants/color_constants.dart';

class VendorDashboard extends StatefulWidget {
  const VendorDashboard({Key? key}) : super(key: key);

  @override
  State<VendorDashboard> createState() => _VendorDashboardState();
}

class _VendorDashboardState extends State<VendorDashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      VendorHome(
        storeName: 'Artisan',
        menu: 'https://i.postimg.cc/fR4DPC9j/menu2.png',
        url:
            'https://media-cdn.tripadvisor.com/media/photo-s/0f/08/bc/11/main-dining.jpg',
        aboutUs:
            'Since our modest beginnings in 2005 with a little space in Toronto’s stylish Yorkville locale, ‘Artisan’ ‘s development has been enlivened with the energy to cook and serve solid, Indian-roused takeout food.',
      ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
