import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/common/styles.dart';
import 'package:provider_example/store/store.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff00a3dc),
          ),
        ),
        title: Text('Summary-Medical', style: TextStyle(color: Colors.black)),
        elevation: 8,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              store.clearCart();
            },
            icon: Icon(
              Icons.clear_all,
              color: Color(0xff00a3dc),
            ),
          )
        ],
      ),
      body: ListView(children: [
        ...store.cart.map((item) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 80,
                    height: 80,
                    child: Image(
                      height: 80,
                      width: 80,
                      image: AssetImage(
                        "assets/images/${item.image}",
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${item.name}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "\$ ${(item.price * item.quantity).toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Text("Quantity: "),
                          InkWell(
                            onTap: () => store.removeItemFromCart(item),
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
                                item.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => store.addItemToCart(item),
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
                  )),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red.shade800),
                      onPressed: () => store.removeItemFromCart(item),
                    ),
                  ),
                ],
              ));
        }),
        (store.cart.length > 0)
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black45),
                          ),
                          Text(
                            "\$ ${store.getCartTotal().toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black45),
                          ),
                          Text(
                            "0",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tax",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black45),
                          ),
                          Text(
                            "10 %",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$ ${store.getTotal().toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 200,
                child: Center(child: Text("Cart is empty.")),
              ),
        SizedBox(
          height: 10,
        ),
        (store.cart.length > 0)
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Checkout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    store.navigatoToPersonalInfo(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff00a3dc),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }
}
