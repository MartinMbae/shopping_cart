
import 'package:flutter/cupertino.dart';

class FeaturedProduct {
  final id, title, description, price, discount, image, priority;

  var isAddedToCart = false;

  FeaturedProduct({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.discount,
    @required this.image,
    @required this.priority
  });

}


final featuredProducts = [
  FeaturedProduct(
      id: 1,
      title: "Shirt",
      description: "This is a D\$G Shirt",
      priority: 1,
      price: 200,
      discount: 10,
      image: "assets/img1.jpeg",
  ),


  FeaturedProduct(
      id: 2,
      title: "Trouser",
      description: "This is a trouser",
      priority: 2,
      price: 100,
      discount: 10,
      image: "assets/img2.jpeg",
  ),


  FeaturedProduct(
      id: 3,
      title: "Shoe",
      description: "This is a sample Shoe",
      priority: 3,
      price: 230,
      discount: 30,
      image: "assets/img1.jpeg",
  ),


];