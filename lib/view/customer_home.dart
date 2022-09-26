import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_ordring/view/restaurants_details_page.dart';
import 'package:readmore/readmore.dart';

import '../constants/color_constants.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  List<String> listOfRestaurantsImages = [
    "https://cdn.cnn.com/cnnnext/dam/assets/140327130104-europes-expensive-restaurants-horizontal-large-gallery.jpg",
    "https://cdn.cnn.com/cnnnext/dam/assets/111103061008-top-revolving-restaurants-tl-restaurant-181-horizontal-large-gallery.jpg",
    "https://restaurant.eatapp.co/hs-fs/hubfs/Horizontal%20Module%20Image%20(1)-1.png?width=1059&height=540&name=Horizontal%20Module%20Image%20(1)-1.png",
    "https://cdn.cnn.com/cnnnext/dam/assets/120524040801-airport-restaurant-5-horizontal-large-gallery.jpg",
    "https://images.squarespace-cdn.com/content/v1/5c93e471f4e531105e956f83/1654103315325-2JCI9SJ6WI71ZWHRN4A9/HorizontalBlue.jpeg",
    "https://cdn.vox-cdn.com/thumbor/i7qncQYzKnTaIORzuXIHwm7WL7w=/56x0:832x582/1200x800/filters:focal(56x0:832x582)/cdn.vox-cdn.com/uploads/chorus_image/image/49413863/Screen_Shot_2016-04-27_at_7.42.59_AM.0.0.png",
    "https://popmenucloud.com/drlykqmx/25e14609-9562-42a2-b215-3f12eddee5e2.jpg",
    "https://assets.simpleviewinc.com/simpleview/image/upload/crm/toronto/library5_5f56e350-5056-a36f-2372e0e2c3f577d7.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/0f/08/bc/11/main-dining.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/0f/08/bc/11/main-dining.jpg",
  ];
  List<String> listOfRestaurantsName = [
    "Artisan",
    "Chef Food",
    "Eat out",
    "Food planet",
    "Fresh Food",
    "iFood",
    "Kitchen",
    "Relish Food",
    "The Local food",
    "Uncle Sammy"
  ];

  List<String> listOfAboutUs = [
    "Since our modest beginnings in 2005 with a little space in Toronto’s stylish Yorkville locale, ‘Artisan’ ‘s development has been enlivened with the energy to cook and serve solid, Indian-roused takeout food.",
    "chef food’ Restaurants are well known with a substantial gathering of people including families, kids, seniors, and business experts. Our benevolent condition is perfect for praising unique events, facilitating a business lunch, or assembling for a flavorful dinner with loved ones.",
    "At the point when ‘eat out’ organizer Tony ventured off the shorelines of Oahu following multi-day of surfing with his Navy pals in the mid-60s, he did what worked out easily for him. He went hunting down a delicious burger, a hot container of fries, and a virus drink.",

    "food planet’ was worked for people in general and has advanced into a combination between exquisite chic and contemporary fine charge Enjoy our dazzling dishes and make the most of your eating background with us!",
    "fresh food ‘ is additionally home to the amazing Table-Side Caesar Spun Signature Salad, specially made tableside from a rundown of 10 fixings including blue cheddar, shrimp, olives, banana peppers, anchovies.",
    "Notable, sleek and modern, ‘ifood’ makes excitingly singular hotels for individual personalities. We charm our movement shrewd, present day visitors with a veritable, welcoming mood. We make fervor with our shocking, driving edge structure.",
    "In 1776 Captain ‘Kitchen Restaurant’ Snow manufactured the stately block Federal-style house that stands gladly today at 90 Central Park Street. In the course of recent hundreds of years the house has had different proprietors and utilization, Founder name dwelled here in the mid 1800’s and began the establishment of what might later turn into a Co-operative Bank in the house.",
    "Relish food’ falls under the aegis of ‘The local food . ‘The local food’ has nearness in six nations under the extravagance ‘Hotel 1’ and five-star ‘Hotel 2’ mark. Established in 1945, it works 30 hotels, a Nile Cruiser, and a Motor Vessel in the backwaters of the Countryside. The Group is additionally occupied with flight cooking, air terminal eateries, travel and visit administrations, vehicle rentals, venture the board, and corporate air sanctions.",
    "Established by ‘Den Mendis’ in 1972, the Tata gather is a worldwide undertaking, involving more than 100 freely working organizations. The gathering works in excess of six landmasses with a mission to enhance the personal satisfaction of the networks it serves all around.",
    "Uncle sammy and Resorts is synonymous the world over with giving the correct mix of service, extravagance and calm effectiveness. Universally acclaimed for all-round greatness and unparalleled dimensions of service, ‘uncle sammy’ and resorts have gotten countless honors and awards."  ];
  List<String> listOfMenu= ["https://i.postimg.cc/MpRKZNSF/menu1.png",
    "https://i.postimg.cc/rmhqYL1K/menu10.jpg",

    "https://i.postimg.cc/fR4DPC9j/menu2.png",
    "https://i.postimg.cc/x8hnnyFQ/menu3.webp",
    "https://i.postimg.cc/59RxBb9r/menu4.png",
    "https://i.postimg.cc/Fz7NMnpG/menu5.jpg",
    "https://i.postimg.cc/vmtYfnD7/menu6.jpg",
    "https://i.postimg.cc/zXHqp6VG/menu7.png",
    "https://i.postimg.cc/VN8sJgsL/menu8.jpg",
    "https://i.postimg.cc/k4Mnc5t0/menu9.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getListOfRestronts(),
                builder: (context, snapshot) {
                  if (true) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          //print(snapshot.data);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestaurantsDetails(
                                             menu:listOfMenu[index],
                                              aboutUs: listOfAboutUs[index],
                                              url: listOfRestaurantsImages[
                                                  index],
                                              storeName:
                                                  listOfRestaurantsName[index],
                                            )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                elevation: 2,
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 170,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      listOfRestaurantsImages[
                                                          index],
                                                  // _con.imgList[5],
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                                // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          listOfRestaurantsName[
                                                              index],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18)),
                                                    ],
                                                  ),
                                                  ReadMoreText(
                                                    listOfAboutUs[index],
                                                    trimLines: 3,
                                                    textAlign:
                                                    TextAlign.justify,
                                                    trimMode: TrimMode.Line,
                                                    trimCollapsedText:
                                                    " Show More ",
                                                    trimExpandedText:
                                                    " Show Less ",
                                                    lessStyle: TextStyle(
                                                        color: kOrange),
                                                    moreStyle: TextStyle(
                                                        color: kOrange),
                                                    style: TextStyle(
                                                        color: kGreyFont),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })
          ],
        ),
      ),
    );
  }

  getListOfRestronts() {}
}
