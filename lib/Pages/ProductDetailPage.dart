import 'package:dainmart_sample/Pages/CartPage.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String product;
  final String productImg;
  final double productPrice;
  final String desc;
  final double rating;

  const ProductDetailPage({super.key,
    required this.product,
    required this.productImg,
    required this.productPrice, required this.desc, required this.rating,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<String> sizes = ['S', 'M', 'L', 'XL','XXL'];
  String selectedSize = 'S'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        shape: const OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),borderSide: BorderSide.none),


        title: Text('${widget.product} Details',style: const TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            iconSize: 28,
            tooltip: 'Open shopping cart',

            onPressed: () {
              // Navigate to cart page (to be implemented)
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
            },
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.productImg,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xFF333333)),
            ),
            const SizedBox(height: 8),
            Text(
              widget.desc,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFF666666)),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ₹ ${widget.productPrice}',
              style: const TextStyle(fontSize: 18, color: Color(0xFF16CA13), fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Ratings: ${widget.rating}',
              style: const TextStyle(fontSize: 18, color: Color(0xFFF68310),fontWeight: FontWeight.bold),
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
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  CartManager().addItem({
                    'title':widget.product,
                    'price':widget.productPrice,
                    'image':widget.productImg,
                    'size':selectedSize,
                    'quantity':1,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added ${widget.product} (Size: $selectedSize) to cart!'),
                    ),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
