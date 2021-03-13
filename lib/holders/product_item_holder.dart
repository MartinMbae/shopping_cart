import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shopping_cart/holders/simple_row.dart';
import 'package:shopping_cart/models/featured_products.dart';
import 'package:shopping_cart/models/products.dart';

class ProductHolder extends StatefulWidget {
  final Product product;

  const ProductHolder(
      {Key key, @required this.product})
      : super(key: key);

  @override
  _ProductHolderState createState() => _ProductHolderState();
}

class _ProductHolderState extends State<ProductHolder> {

  @override
  Widget build(BuildContext context) {
    String heroTag = "imageHero${widget.product.id}";

    Size size = MediaQuery.of(context).size;

    return Container(
      height: 140,
      width: size.width,
      color: Colors.white,
      padding: EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Container(
              width: size.width / 3,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: GestureDetector(
                    child: Hero(
                      tag: heroTag,
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SingleImageScreen(
                            tag: heroTag,
                            imageUrl: widget.product.image);
                      }));
                    }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleRow(
                      title: "Title",
                      subtitle: widget.product.title),
                  SimpleRow(
                      title: "Description",
                      subtitle: widget.product.description),
                  SimpleRow(
                      title: "Price",
                      subtitle: widget.product.price),
                  SimpleRow(
                      title: "Discount",
                      subtitle: widget.product.discount),
                  RaisedButton(
                    onPressed: (){

                    },
                    child: Text("Add to Cart"),
                  )

                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SingleImageScreen extends StatelessWidget {
  final imageUrl, tag;

  const SingleImageScreen({Key key, @required this.imageUrl, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: tag,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
