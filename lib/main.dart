import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/screens/cart.dart';
import 'package:provider_example/screens/payment_method_view.dart';
import 'package:provider_example/screens/personal_info_view.dart';
import 'package:provider_example/screens/product_list.dart';
import 'package:provider_example/store/store.dart';
import 'package:provider_example/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Store(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Info Inlet',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),          
          '/personalinfo': (context) => PersonalInfoView(),
          '/payment_method': (context) => PaymentMethodView()
        },
      ),
    );
  }
}
