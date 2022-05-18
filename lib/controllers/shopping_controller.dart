import 'package:get/state_manager.dart';
import 'package:manager/models/product.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(id: 1, productName: 'FirstProd', productImage: 'abd', productDescription: 'some description about product', price: 40),
      Product(id: 2, productName: 'Second', productImage: 'abd', productDescription: 'Some Description about product', price: 80),
      Product(id: 3, productName: 'third', productImage: 'abd', productDescription: 'Some decription about product', price: 45)
    ];

    products.value = productResult;
  }
}