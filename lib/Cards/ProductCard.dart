
import 'package:flutter/material.dart';

import '../Model/CartItems.dart';
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
        color: const Color(0x6A01151B),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.only(top: 15,end: 15,start: 15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
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
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('₹ ${CartItems().product[index].price.toString()}', style: const TextStyle(color: Color(
                      0xFF16CA13),fontSize: 16,fontWeight: FontWeight.w800)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}