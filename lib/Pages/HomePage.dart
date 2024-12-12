
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dainmart_sample/Model/CartItems.dart';

import '../Cards/ProductCard.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});

   final List<String> bannerImages = [
     'assets/images/img5.webp',
     'assets/images/img4.jpg',
     'assets/images/img6.png',
     'assets/images/img7.png',
   ];

  

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawerEnableOpenDragGesture: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // shape: OutlineInputBorder(),
        title: Image.asset('assets/images/logo.png',width: 150,height: 60,),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Open shopping cart',
            iconSize: 28,

            onPressed: () {
              // handle the press

            },
          ),
          const SizedBox(width: 5,),
          IconButton(
            icon: const Icon(Icons.person_outline_rounded),
            tooltip: ' Profile',
            iconSize: 30,

            onPressed: () {
              // handle the press

            },
          ),
          SizedBox(width: 10,)
        ],
      ),
      drawer: const Drawer(
        child: Text('Drawer'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.height * 0.25
                    : MediaQuery.of(context).size.height * 0.45,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: bannerImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: CartItems().product.length,
              itemBuilder: (context, index) {
                return ProductCard(index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}




