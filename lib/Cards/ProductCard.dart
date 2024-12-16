//
// import 'package:flutter/material.dart';
//
// import '../Model/CartItems.dart';
// import '../Pages/ProductDetailPage.dart';
//
// class ProductCard extends StatelessWidget {
//   final int index;
//
//
//   const ProductCard({super.key, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailPage(product: CartItems().product[index].title, productImg: CartItems().product[index].imgPath,productPrice: CartItems().product[index].price,desc: CartItems().product[index].desc,rating: CartItems().product[index].rating,),
//           ),
//         );
//       },
//       child: Card(
//         color: const Color(0xFFFFFFFF),
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsetsDirectional.only(top: 15,end: 15,start: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
//                   image: DecorationImage(
//                     image: AssetImage(CartItems().product[index].imgPath),
//                     fit: BoxFit.scaleDown,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     CartItems().product[index].title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text('₹ ${CartItems().product[index].price.toString()}', style: const TextStyle(color: Color(
//                       0xFF16CA13),fontSize: 16,fontWeight: FontWeight.w800)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/CartItems.dart';
import '../Pages/ProductDetailPage.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final Map<String,dynamic> product;

  const ProductCard({super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartItems>();
    final isInWishlist = cartItems.wishlist.any((item) => item['title'] == product['title']);
    final isInCart = cartItems.cart.any((item) => item['title'] == product['title']);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        color: const Color(0xFFFFFFFF),
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
                    image: AssetImage(product['imgPath']),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    tooltip: 'Add To WishList',
                    iconSize: 28,

                    icon: Icon(Icons.favorite, color: isInWishlist ? Colors.red : Colors.grey),
                    onPressed: () {
                      if (isInWishlist) {
                        cartItems.removeFromWishlist(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Removed ${product['title']} from Wishlist!'),
                          ),
                        );
                      } else {
                        cartItems.addToWishlist(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${product['title']} to Wishlist!'),
                          ),
                        );
                      }
                    },
                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('₹ ${product['price'].toString()}', style: const TextStyle(color: Color(
                          0xFF16CA13),fontSize: 16,fontWeight: FontWeight.w800)),
                    ],
                  ),

                  IconButton(
                    // icon: const Icon(Icons.add_shopping_cart_rounded),
                    tooltip: 'Add To Shopping Cart',
                    iconSize: 28,
                    icon: Icon(Icons.add_shopping_cart_outlined, color: isInCart ? Colors.green : Colors.grey),
                    onPressed: () {
                      if (isInCart) {
                        cartItems.removeFromCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Removed ${product['title']} from cart!'),
                          ),
                        );
                      } else {
                        cartItems.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${product['title']} to cart!'),
                          ),
                        );
                      }

                    // onPressed: () {
                    //   CartManager().addItem({
                    //     'title':product['title'],
                    //     'price':product['price'],
                    //     'image':product['imgPath'],
                    //     'quantity':1,
                    //   });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}