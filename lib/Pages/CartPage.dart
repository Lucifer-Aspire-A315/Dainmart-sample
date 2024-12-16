import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/CartItems.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartItems>().cart;

    return Scaffold(
      appBar: AppBar(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            borderSide: BorderSide.none),
        title: const Text(
          'Cart Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your wishlist is empty!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: Image.asset(
                            item['imgPath'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item['title']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price: ₹${item['price']}'),
                              Text('Size: ${item['size']}'),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  IconButton(
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                    onPressed: () {
                                      setState(() {
                                        if (item['quantity'] > 1) {
                                          context
                                              .read<CartItems>()
                                              .updateItemQuantity(
                                                  index, item['quantity'] - 1);
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    item['quantity'].toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                      icon:
                                          const Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        setState(
                                          () {
                                            context
                                                .read<CartItems>()
                                                .updateItemQuantity(index,
                                                    item['quantity'] + 1);
                                          },
                                        );
                                      })
                                ],
                              ),
                            ],
                          ),
                          // Text('Price: ₹${item['price']}'),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  context
                                      .read<CartItems>()
                                      .removeFromCart(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Removed ${item['title']} from cart!'),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.star, color: Colors.green),
                                onPressed: () {
                                  context.read<CartItems>().addToWishlist(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Added ${item['title']}  to Wishlist!'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        // 'Total: ₹${cartManager.calculateTotal().toStringAsFixed(2)}',
                        'Total: ${context.read<CartItems>().calculateTotal()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Implement checkout functionality
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

// import 'package:dainmart_sample/Model/CartItems.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // class CartManager {
// //   static final CartManager _instance = CartManager._internal();
// //
// //   factory CartManager() {
// //     return _instance;
// //   }
// //
// //   CartManager._internal();
// //
// //   final List<Map<String, dynamic>> cartItems = [];
// //
// //   void addItem(Map<String, dynamic> item) {
// //     cartItems.add(item);
// //   }
// //
// //   void removeItem(int index) {
// //     cartItems.removeAt(index);
// //   }
// //
//   void updateItemQuantity(int index, int quantity) {
//     cartItems[index]['quantity'] = quantity;
//   }
//
//   double calculateTotal() {
//     return cartItems.fold(
//       0.0,
//           (sum, item) => sum + (item['price'] * item['quantity']),
//     );
//   }
// // }
//
// class CartPage extends StatefulWidget {
//   const CartPage({super.key});
//
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     // final cartManager = CartManager();
//     final cartItem = context.watch<CartItems>().cart;
//
//     return Scaffold(
//       appBar: AppBar(
//         shape: const OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),borderSide: BorderSide.none),
//         title: const Text('My Cart',style: TextStyle(color: Colors.white),),
//       ),
//       body: cartItem.isEmpty
//           ? const Center(
//         child: Text(
//           'Add Something To Your Cart.',
//           style: TextStyle(fontSize: 18),
//         ),
//       )
//           : Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartItem.length,
//               itemBuilder: (context, index) {
//                 final item = cartItem[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           image: DecorationImage(
//                             image: AssetImage(item['imgPath']),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Product : ${item['title']}',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               'Size : ${item['size']}',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               'Price : ₹${item['price'].toString()}',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.remove_circle_outline),
//                                   onPressed: () {
//                                     setState(() {
//                                       if (item['quantity'] > 1) {
//                                         context.read<CartItems>().updateItemQuantity(
//                                         index, item['quantity'] - 1);
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   item['quantity'].toString(),
//                                   style: const TextStyle(fontSize: 16),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.add_circle_outline),
//                                   onPressed: () {
//                                     setState(() {
//                                       context.read<CartItems>()
//                                           .updateItemQuantity(
//                                           index, item['quantity'] - 1);
//                                     },
//                                     );
//                                   }
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           setState(() {
//                             context.read<CartItems>().removeFromCart(item);
//
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   // 'Total: ₹${cartManager.calculateTotal().toStringAsFixed(2)}',
//                   'Total: ${context.read()<CartItems>().calculateTotal().toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Implement checkout functionality
//                   },
//                   child: const Text('Checkout'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // import 'package:dainmart_sample/Model/CartItems.dart';
// // import 'package:flutter/material.dart';
// //
// // class CartPage extends StatefulWidget {
// //   const CartPage({super.key});
// //
// //   @override
// //   State<CartPage> createState() => _CartPageState();
// // }
// //
// // class _CartPageState extends State<CartPage> {
// //   void _incrementQuantity(int index) {
// //     setState(() {
// //       CartItems().product[index].quantity++;
// //     });
// //   }
// //
// //   void _decrementQuantity(int index) {
// //     setState(() {
// //       if (CartItems().product[index].quantity > 1) {
// //         CartItems().product[index].quantity--;
// //       }
// //     });
// //   }
// //
// //   void _removeItem(int index) {
// //     setState(() {
// //       // cartItems.removeAt(index);
// //       CartItems().product.removeAt(index);
// //     });
// //   }
// //
// //   double _calculateTotal() {
// //     return CartItems().product.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('My Cart'),
// //       ),
// //       body: CartItems().product.isEmpty
// //           ? Center(
// //         child: Text(
// //           'Your cart is empty.',
// //           style: TextStyle(fontSize: 18),
// //         ),
// //       )
// //           : Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: CartItems().product.length,
// //               itemBuilder: (context, index) {
// //                 final item = CartItems().product[index];
// //                 return Card(
// //                   margin: const EdgeInsets.all(8.0),
// //                   child: Row(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Container(
// //                         width: 100,
// //                         height: 100,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8),
// //                           image: DecorationImage(
// //                             image: AssetImage(item.imgPath),
// //                             fit: BoxFit.cover,
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       Expanded(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               item.title,
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             SizedBox(height: 5),
// //                             Text(
// //                               '₹${item.price.toString()}',
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.green,
// //                               ),
// //                             ),
// //                             SizedBox(height: 10),
// //                             Row(
// //                               children: [
// //                                 IconButton(
// //                                   icon: Icon(Icons.remove_circle_outline),
// //                                   onPressed: () => _decrementQuantity(index),
// //                                 ),
// //                                 Text(
// //                                   item.quantity.toString(),
// //                                   style: TextStyle(fontSize: 16),
// //                                 ),
// //                                 IconButton(
// //                                   icon: Icon(Icons.add_circle_outline),
// //                                   onPressed: () => _incrementQuantity(index),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       IconButton(
// //                         icon: Icon(Icons.delete, color: Colors.red),
// //                         onPressed: () => _removeItem(index),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 Text(
// //                   'Total: ₹${_calculateTotal().toStringAsFixed(2)}',
// //                   style: TextStyle(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 SizedBox(height: 10),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     // Implement checkout functionality
// //                   },
// //                   child: Text('Checkout'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
