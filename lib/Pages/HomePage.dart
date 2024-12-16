
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dainmart_sample/Cards/Category.dart';
import 'package:dainmart_sample/Pages/CartPage.dart';
import 'package:dainmart_sample/Pages/UserProfilePage.dart';
import 'package:dainmart_sample/Pages/WishListPage.dart';
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

   final List<Map<String, String>> categories = [
     {'name': 'Men', 'image': 'assets/images/img6.png'},
     {'name': 'Women', 'image': 'assets/images/img2.png'},
     {'name': 'Kid', 'image': 'assets/images/img7.png'},
     {'name': 'Accessories', 'image': 'assets/images/img1.png'},
     {'name': 'Child', 'image': 'assets/images/img7.png'},

   ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawerEnableOpenDragGesture: true,

      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        shape: const OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),borderSide: BorderSide.none),
        // shape: OutlineInputBorder(),
        title: Image.asset('assets/images/logo.png',width: 150,height: 60,),
        titleSpacing: 50,
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border_outlined),
            tooltip: 'Open Wishlist cart',
            iconSize: 28,

            onPressed: () {
              // handle the press
              Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistPage()));
            },
          ),
          const SizedBox(width: 5,),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Open shopping cart',
            iconSize: 28,

            onPressed: () {
              // handle the press
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartPage()));
            },
          ),
          const SizedBox(width: 5,),
          IconButton(
            icon: const Icon(Icons.person_outline_rounded),
            tooltip: ' Profile',
            iconSize: 30,

            onPressed: () {
              // handle the press
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserProfilePage()));

            },
          ),
          const SizedBox(width: 10,)
        ],
      ),
      // drawer: const Drawer(
      //   child: Text('Drawer'),
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.height * 0.25
                      : MediaQuery.of(context).size.height * 0.45,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: bannerImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: categories.map((category) {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to category-specific page
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Category(category: category['name']!)));
                            },
                            child: Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      image: DecorationImage(
                                        image: AssetImage(category['image']!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(category['name']!,
                                      style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                            );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              /*GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75
                ),
                itemCount: CartItems().product.length,
                itemBuilder: (context, index) {
                  return ProductCard(index: index);
                },
              ),*/
              GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(), // Avoid unnecessary scrolling
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: CartItems().product.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Rounded corners for smooth rendering
                    child: ProductCard(index: index, product: CartItems().product[index].toMap(),),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}




