import 'package:dainmart_sample/Pages/CartPage.dart';
import 'package:dainmart_sample/Pages/WishListPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/CartItems.dart';

class ProductDetailPage extends StatefulWidget {
  // final String product;
  // final String productImg;
  // final double productPrice;
  // final String desc;
  // final double rating;
  final Map<String, dynamic> product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  String selectedSize = 'S'; // Default selected size

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartItems>();
    final isInWishlist = cartItems.wishlist
        .any((item) => item['title'] == widget.product['title']);
    final isInCart =
        cartItems.cart.any((item) => item['title'] == widget.product['title']);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            borderSide: BorderSide.none),

        title: Text(
          '${widget.product['title']} Details',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border_outlined),
            iconSize: 28,
            tooltip: 'Open WishList',
            onPressed: () {
              // Navigate to cart page (to be implemented)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WishlistPage()));
            },
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            iconSize: 28,
            tooltip: 'Open shopping cart',
            onPressed: () {
              // Navigate to cart page (to be implemented)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  const CartPage()));
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.product['imgPath'],
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product['title'],
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333)),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product['desc'],
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF666666)),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ₹ ${widget.product['price']}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF16CA13),
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Ratings: ${widget.product['rating']}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFF68310),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Size:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: sizes.map((size) {
                return ChoiceChip(
                  label: Text(size),
                  selected: selectedSize == size,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedSize = size;
                      context
                          .read<CartItems>()
                          .ProductSize(selectedSize, widget.product);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement checkout functionality
                      if (isInWishlist) {
                        cartItems.removeFromWishlist(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Removed ${widget.product['title']} from Wishlist!'),
                          ),
                        );
                      } else {
                        cartItems.addToWishlist(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Added ${widget.product['title']} to Wishlist!'),
                          ),
                        );
                      }
                    },
                    child: const Text('Add To WishList',style: TextStyle(color: Colors.black),),
                    style: ButtonStyle(
                        backgroundColor:
                            isInWishlist ?
                            WidgetStatePropertyAll(Colors.lightGreen): WidgetStatePropertyAll(Colors.grey)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isInCart) {
                        cartItems.removeFromCart(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Removed ${widget.product['title']} from cart!'),
                          ),
                        );
                      } else {
                        cartItems.addToCart(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Added ${widget.product['title']} to cart!'),
                          ),
                        );
                      }
                    },
                    child: Text('Add to Cart',style: TextStyle(color: Colors.black),),
                    style: ButtonStyle(
                        backgroundColor:
                        isInCart ?
                        WidgetStatePropertyAll(Colors.lightGreen): WidgetStatePropertyAll(Colors.grey)),
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
