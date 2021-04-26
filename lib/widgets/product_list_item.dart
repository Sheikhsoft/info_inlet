import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/common/styles.dart';
import 'package:provider_example/models/product.dart';
import 'package:provider_example/store/store.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({this.product});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Image(
            image: AssetImage("assets/images/${product.image}"),
            width: 100,
            height: 75,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.name}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => store.removeItemFromCart(product),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red.shade800,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: Colors.red.shade800),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(10, 10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          product.quantity.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => store.addItemToCart(product),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: iPrimaryColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: iPrimaryColor),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: () => {store.addItemToCart(product)},
            ),
          )
        ],
      ),
    );
  }
}
