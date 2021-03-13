import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shopping_cart/holders/featured_item_holder.dart';
import 'package:shopping_cart/holders/product_item_holder.dart';
import 'package:shopping_cart/models/featured_products.dart';
import 'package:shopping_cart/models/products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int itemsInCart = 0;
  int totalPrice = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shplivy Products"),
        actions: [
          Row(
            children: [
              Icon(Icons.shopping_cart),
              Text("$itemsInCart")
            ],
          )
        ],

      ),
      body:  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background_pattern.png"),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: featuredProducts.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: featuredProducts.map(buildFeaturedItems).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView(
                padding: EdgeInsets.only(bottom: 30),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: products.map(buildProductItems).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("The total Price of selected Items is $totalPrice")));
        },
        child: Text("$totalPrice"),
      ),
    );
  }



  Widget buildFeaturedItems(FeaturedProduct featuredProduct) {
    return GestureDetector(
      onTap: () async {

      },
      child: GridTile(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeaturedProductHolder(featuredProduct: featuredProduct),
            SizedBox(
              height:10,
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  if(featuredProduct.isAddedToCart){
                    itemsInCart--;
                    totalPrice -= featuredProduct.price;
                    featuredProduct.isAddedToCart = false;

                  }else {
                    itemsInCart++;
                    totalPrice += featuredProduct.price;
                    featuredProduct.isAddedToCart = true;
                  }
                });
              },
              child: Text(  featuredProduct.isAddedToCart? "Remove from cart":"Add to Cart"),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductItems(Product product) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductHolder(product: product),
        SizedBox(
          height:10,
        ),
        RaisedButton(
          onPressed: (){
            setState(() {
              if(product.isAddedToCart){
                itemsInCart--;
                totalPrice -= product.price;
                product.isAddedToCart = false;
              }else {
                itemsInCart++;
                totalPrice += product.price;
                product.isAddedToCart = true;
              }
            });
          },
          child: Text(  product.isAddedToCart? "Remove from cart":"Add to Cart"),
        )
      ],
    );
  }
}

