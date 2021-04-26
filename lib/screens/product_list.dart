import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:provider_example/common/styles.dart';
import 'package:provider_example/models/product.dart';
import 'package:provider_example/store/store.dart';
import 'package:provider_example/widgets/product_list_item.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Medical",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 8,
        actions: [
          Badge(
            showBadge: store.getCartQuantity() > 0,
            position: BadgePosition(top: 0, right: 2),
            animationType: BadgeAnimationType.scale,
            badgeContent: Text(
              store.getCartQuantity().toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: iPrimaryColor,
              ),
              onPressed: () => Navigator.pushNamed(context, '/cart'),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            ...store.products.map((item) {
              return ProductListItem(product: item);
            }),
          ],
        ),
      ),
    );
  }
}
