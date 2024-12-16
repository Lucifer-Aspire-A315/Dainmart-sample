import 'package:flutter/cupertino.dart';

class Products{
  final String title;
  final String imgPath;
  final double price;
  final String desc;
  final double rating;
  final String gender;
  late double quantity=0;
  late String size = 'S';
  Products(this.title, this.imgPath, this.price, this.desc, this.rating, this.quantity, this.gender,this.size);

  Map<String,dynamic> toMap(){
    return {
    'title': title,
      'imgPath':imgPath,
      'price': price,
      'desc':desc,
      'rating':rating,
      'gender':gender,
      'quantity':quantity,
  };
    }
}

class CartItems with ChangeNotifier{
  final List<Products> product = [
    Products('Top', 'assets/images/img2.png', 399, 'White Top With Designs', 4.0,0,'Women','S'),
    Products('Jeans', 'assets/images/img3.png', 499, 'Black Jeans', 4.0,0,'Women','S'),
    Products('Western Top', 'assets/images/img6.png', 399, 'Western Top With Designs', 4.5,0,'Men','S'),
    Products('Bottom Wear', 'assets/images/img1.png', 400, 'Black Bottom With Designs', 4.0,0,'Child','S'),
    Products('Jacket', 'assets/images/img7.png', 600, 'White Top With Designs', 3.0,0,'Kid','S'),
    Products('Shirt', 'assets/images/img4.jpg', 399, 'White Shirt With Designs', 4.0,0,'Men','S'),
    Products('Dress', 'assets/images/img3.png', 599, 'Blue Dress with Designs', 4.5,0,'Accessories','S')
  ];
  final List<Map<String,dynamic>> _cart = [];
  final List<Map<String,dynamic>> _wishlist = [];


  List<Map<String,dynamic>> get cart => _cart;
  List<Map<String,dynamic>> get wishlist => _wishlist;

  void addToCart(Map<String,dynamic> item){
    if(!_cart.any((cartItem) => cartItem['title'] == item['title'])){
      _cart.add(item);
      notifyListeners();
    }
  }

  void removeFromCart(Map<String,dynamic> item) {
    _cart.removeWhere((cartItem) => cartItem['title'] == item['title']);
    notifyListeners();
  }

  void updateItemQuantity(int index, int quantity) {
    _cart[index]['quantity'] = quantity;
  }

    // Add to wishlist
    void addToWishlist(Map<String, dynamic> item) {
      if (!_wishlist.any((wishlistItem) => wishlistItem['title'] == item['title'])) {
        _wishlist.add(item);
        notifyListeners();
      }
    }

    void ProductSize(String size,Map<String,dynamic> item){
      if(!_cart.any((cartItem) => cartItem['title'] == item['title'])){
        item['size'] = size;
        notifyListeners();
      }
    }

  double calculateTotal() {
    return _cart.fold(
      0.0,
          (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }


    // Remove from wishlist
    void removeFromWishlist(Map<String, dynamic> item) {
      _wishlist.removeWhere((wishlistItem) => wishlistItem['title'] == item['title']);
      notifyListeners();
    }


}