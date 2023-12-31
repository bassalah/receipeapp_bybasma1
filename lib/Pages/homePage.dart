import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/ad.model.dart';
import '../widgets/section_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List items=[1,2,3,4,5] ;

  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();

  List<Ad> adsList = [];
  void getAds() async {
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
    List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

    adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    setState(() {});
  }
  void initState() {
    getAds();
    super.initState();
  }


    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding:
            EdgeInsets.all(20),
            child: Icon(Icons.menu),
          ),
          actions:  [
            Padding(
              padding: EdgeInsets.all(20),
             child:  Icon(Icons.notifications),
            )
          ],
        ),
        body: SafeArea(
          child: adsList.isEmpty
              ? const CircularProgressIndicator()
              : Column(
            children: [
              CarouselSlider(
                carouselController: carouselControllerEx,
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    viewportFraction: .75,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) {
                      sliderIndex = index;
                      setState(() {});
                    },
                    enlargeFactor: .3),
                items: adsList.map((ad) {
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(ad.image!))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                         width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              image: DecorationImage(
                         fit: BoxFit.fitWidth,
                       image:NetworkImage("    ")
                       ),
    ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration:BoxDecoration(
                          color: Colors.black38,
                        borderRadius: BorderRadius.circular(25)) ,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ad.title.toString(),
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              DotsIndicator(
                dotsCount: adsList.length,
                position: sliderIndex,
                onTap: (position) async {
                  await carouselControllerEx.animateToPage(position);
                  sliderIndex = position;
                  setState(() {});
                },
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              SectionHeader(sectionName: 'Today\'s Fresh Recipes'),
              SectionHeader(sectionName: 'New Ingredients'),
            ],
          ),
        ),
      );
    }
  }






