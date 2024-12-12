//
// import 'package:flutter/material.dart';
//
// class ProductDetailPage extends StatefulWidget {
//   final String product;
//   final String productImg;
//   final double productPrice;
//
//   const ProductDetailPage({super.key, required this.product, required this.productImg, required this.productPrice});
//
//   @override
//   State<ProductDetailPage> createState() => _ProductDetailPageState();
// }
//
// class _ProductDetailPageState extends State<ProductDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> sizes = ['S','M','L','XL','XXL'];
//     String selectedSize = 'S';
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.product} Details'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Navigate to cart page (to be implemented)
//             },
//           )
//         ],
//       ),
//       body: Padding(padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Image.asset(widget.productImg,height: 300,fit:BoxFit.cover,),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             widget.product,
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Price: ₹${widget.productPrice}',
//             style: const TextStyle(fontSize: 18, color: Colors.green),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Select Size:',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Wrap(
//             spacing: 8.0,
//             children: sizes.map((size) {
//               return ChoiceChip(
//                 label: Text(size),
//                 selected: selectedSize == size,
//                 onSelected: (bool selected) {
//                   setState(() {
//                     selectedSize = size;
//                   });
//
//                 },
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 16),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Added ${widget.product} (Size: $selectedSize) to cart!'),
//                   ),
//                 );
//               },
//               child: const Text('Add to Cart'),
//             ),
//           ),
//         ],
//       ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String product;
  final String productImg;
  final double productPrice;
  final String desc;
  final double rating;

  ProductDetailPage({
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
        backgroundColor: Colors.transparent,

        title: Text('${widget.product} Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            iconSize: 28,
            tooltip: 'Open shopping cart',

            onPressed: () {
              // Navigate to cart page (to be implemented)
            },
          ),
          SizedBox(width: 10,)
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
            SizedBox(height: 16),
            Text(
              widget.product,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.desc,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Price: ₹${widget.productPrice}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              'Ratings: ${widget.rating}',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Select Size:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
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
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added ${widget.product} (Size: $selectedSize) to cart!'),
                    ),
                  );
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
