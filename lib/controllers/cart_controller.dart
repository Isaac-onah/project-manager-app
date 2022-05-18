import 'package:get/state_manager.dart';
import 'package:manager/models/product.dart';

class CartController extends GetxController{
  var cartItems= <Product>[].obs;

  ///find the count
  int get count => cartItems.length;
  ///find the total price
 double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);


  addToCart(Product product){
    cartItems.add(product);
  }
  removeFromCart(Product product){
    cartItems.remove(product);
  }
}