import 'package:flutter/material.dart';

import '../Model/CartItems.dart';
import '../Pages/CartPage.dart';
import 'ProductCard.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    final filterCategory = CartItems().product.where((prod)=> prod.gender == category).toList();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        shape: const OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),borderSide: BorderSide.none),


        title: Text('${category}s Category',style: const TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            iconSize: 28,
            tooltip: 'Open shopping cart',

            onPressed: () {
              // Navigate to cart page (to be implemented)
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
            },
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: filterCategory.isEmpty
          ? Center(
        child: Text('No products available in this category.'),
      )
          :GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount:filterCategory.length,
        itemBuilder: (context, index) {
          return ProductCard(index: index);
          // return Card(
          //   color: const Color(0x6A01151B),
          //   elevation: 4.0,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Column(
          //
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Container(
          //           margin: const EdgeInsetsDirectional.only(top: 15,end: 15,start: 15),
          //           decoration: BoxDecoration(
          //             borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          //             image: DecorationImage(
          //               image: AssetImage(product.imgPath),
          //               fit: BoxFit.scaleDown,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               product.title,
          //               style: const TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 18
          //               ),
          //             ),
          //             const SizedBox(height: 4),
          //             Text('₹ ${product.price.toString()}', style: const TextStyle(color: Color(
          //                 0xFF16CA13),fontSize: 16,fontWeight: FontWeight.w800)),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
