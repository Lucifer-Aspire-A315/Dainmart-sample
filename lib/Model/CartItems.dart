class Products{
  final String title;
  final String imgPath;
  final double price;
  final String desc;
  final double rating;
  final String gender;
  late double quantity=0;
  Products(this.title, this.imgPath, this.price, this.desc, this.rating, this.quantity, this.gender);
}

class CartItems{
  final List<Products> product = [
    Products('Top', 'assets/images/img2.png', 399, 'White Top With Designs', 4.0,0,'Women'),
    Products('Jeans', 'assets/images/img3.png', 499, 'Black Jeans', 4.0,0,'Women'),
    Products('Western Top', 'assets/images/img6.png', 399, 'Western Top With Designs', 4.5,0,'Men'),
    Products('Bottom Wear', 'assets/images/img1.png', 400, 'Black Bottom With Designs', 4.0,0,'Child'),
    Products('Jacket', 'assets/images/img7.png', 600, 'White Top With Designs', 3.0,0,'Kid'),
    Products('Shirt', 'assets/images/img4.jpg', 399, 'White Shirt With Designs', 4.0,0,'Men'),
    Products('Dress', 'assets/images/img3.png', 599, 'Blue Dress with Designs', 4.5,0,'Accessories')
  ];
}