
import 'package:flutter/material.dart';

import '../Model/CartItems.dart';
import '../Pages/HomePage.dart';
import '../Pages/ProductDetailPage.dart';

class ProductCard extends StatelessWidget {
  final int index;


  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: CartItems().product[index].title, productImg: CartItems().product[index].imgPath,productPrice: CartItems().product[index].price,desc: CartItems().product[index].desc,rating: CartItems().product[index].rating,),
          ),
        );
      },
      child: Card(

        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(CartItems().product[index].imgPath),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CartItems().product[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('₹${CartItems().product[index].price.toString()}', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}