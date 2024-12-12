class Products{
  final String title;
  final String imgPath;
  final double price;
  final String desc;
  final double rating;
  Products(this.title, this.imgPath, this.price, this.desc, this.rating);
}

class CartItems{
  final List<Products> product = [
    Products('Top', 'assets/images/img2.png', 399, 'White Top With Designs', 4.0),
    Products('Jeans', 'assets/images/img3.png', 499, 'Black Jeans', 4.0),
    Products('Western Top', 'assets/images/img6.png', 399, 'Western Top With Designs', 4.5),
    Products('Bottom Wear', 'assets/images/img1.png', 400, 'Black Bottom With Designs', 4.0),
    Products('Jacket', 'assets/images/img7.png', 600, 'White Top With Designs', 3.0),
    Products('Shirt', 'assets/images/img4.jpg', 399, 'White Shirt With Designs', 4.0),
    Products('Dress', 'assets/images/img3.png', 599, 'Blue Dress with Designs', 4.5)
  ];
}