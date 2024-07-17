import 'package:addtocart/data/products_data.dart';
import 'package:addtocart/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  List cartList = [];

  addToCart(index) {
    var curr_item = products_list[index];
    bool found = false;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == curr_item.p_id) {
        found = true;
        cartList[i].productQty++;
        cartList[i].productAmount = cartList[i].productQty * curr_item.p_price;
        print(cartList[i].productAmount);
        notifyListeners();
        break;
      } else {
        found = false;
      }
    }
    if (!found) {
      print("cart is empty");
      cartList.add(CartModel(
          id: curr_item.p_id,
          productName: curr_item.p_name,
          productAmount: curr_item.p_price));
      notifyListeners();
    }
  }

  plus(index) {
    var singleItemPrice =
        cartList[index].productAmount / cartList[index].productQty;
    cartList[index].productQty++;
    cartList[index].productAmount =
        cartList[index].productQty * singleItemPrice;
    cartList[index].productAmount =
        cartList[index].productQty * singleItemPrice;
    notifyListeners();
  }

  minus(index) {
    if (cartList.length == 0) {
      cartList.removeAt(index);
    } else {
      var singleItemPrice =
          cartList[index].productAmount / cartList[index].productQty;
      cartList[index].productQty--;
      cartList[index].productAmount =
          cartList[index].productQty * singleItemPrice;
      cartList[index].productAmount =
          cartList[index].productQty * singleItemPrice;
    }

    notifyListeners();
  }
}
