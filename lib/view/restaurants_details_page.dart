import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_button.dart';
import '../constants/color_constants.dart';

class RestaurantsDetails extends StatefulWidget {
  const RestaurantsDetails(
      {Key? key,
      required this.url,
      required this.storeName,
      required this.aboutUs,
      required this.menu})
      : super(key: key);
  final String url;
  final String storeName;
  final String aboutUs;
  final String menu;
  @override
  State<RestaurantsDetails> createState() => _RestaurantsDetailsState();
}

class _RestaurantsDetailsState extends State<RestaurantsDetails> {
  TextEditingController orderFood = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Food Delivery App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: widget.url,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(widget.storeName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                widget.aboutUs,
                trimLines: 3,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: " Show More ",
                trimExpandedText: " Show Less ",
                lessStyle: TextStyle(color: kOrange),
                moreStyle: TextStyle(color: kOrange),
                style: TextStyle(color: kGreyFont),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 1.2,
                child: CachedNetworkImage(
                  placeholder: (a, b) => Center(
                      child: Container(child: CircularProgressIndicator())),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                  imageUrl: widget.menu,
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter Food Items To Order",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.grey[200],
                  height: 200,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: orderFood,
                      maxLines: 10,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: CustomButton(
                title: 'Order Now',
                onPressed: () {
                  launchUrl(Uri.parse(
                      "whatsapp://send?phone=918839649499&text=${orderFood.text}"));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
