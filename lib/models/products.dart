
import 'package:flutter/cupertino.dart';

class Product {
  final id, title, description, price, discount, image, priority;


  var isAddedToCart = false;


  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.discount,
    @required this.image,
    @required this.priority
  });

}


final products = [
  Product(
      id: 1,
      title: "Laptop",
      description: "This is a laptop srfeurfuerfuihe urfhuereu",
      priority: 1,
      price: 20000,
      discount: 1000,
      image: "assets/img1.jpeg",
  ),


  Product(
      id: 2,
      title: "DJHwuirfhuierh",
      description: "This is a trojeduwhiedjwioeduser",
      priority: 2,
      price: 100,
      discount: 10,
      image: "assets/img2.jpeg",
  ),


  Product(
      id: 3,
      title: "kahefiowej",
      description: "This is a jdfuiwehfiojeorp3e",
      priority: 3,
      price: 230,
      discount: 30,
      image: "assets/img1.jpeg",
  ),


];