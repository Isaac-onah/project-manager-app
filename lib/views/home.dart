import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/controllers/cart_controller.dart';
import 'package:manager/controllers/shopping_controller.dart';

class MyHomePage extends StatelessWidget {
  ///using dependecy injection get.put
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(

              ///make the list view always listen to the data inside controller
              ///wrapp in streambuilder and change to getx
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(12),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('${controller.products[index]
                                            .productName}',
                                          style: TextStyle(fontSize: 24),),
                                        Text('${controller.products[index]
                                            .productDescription}',
                                          style: TextStyle(
                                              fontSize: 14),)
                                      ],
                                    ),
                                    Text(
                                      '\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    RaisedButton(onPressed: () {
                                      cartController.removeFromCart(
                                          controller.products[index]
                                      );
                                    },
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      child: Text('remove from Cart',),),
                                    RaisedButton(onPressed: () {
                                      cartController.addToCart(
                                          controller.products[index]
                                      );
                                    },
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      child: Text('Add to Cart',),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),

            ///wrapp in streambuilder to convert to get x
            GetX<CartController>(
                builder: (controller) {
                  return Text('Total Amount: \$ ${controller.totalPrice}');
                }
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.black,),
          label: GetX<CartController>(builder: (controller) {
            return Text(controller.count.toString());
          }))
      ,
    );
  }
}
