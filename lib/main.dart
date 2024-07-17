import 'package:addtocart/providers/cart_notifiers.dart';
import 'package:addtocart/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartNotifier>(create: (_) => CartNotifier())
    ],
    child: MaterialApp(
//debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: ProductScreen(),
    ),
  ));
}
