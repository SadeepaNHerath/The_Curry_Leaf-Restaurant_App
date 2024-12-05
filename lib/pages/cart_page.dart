import 'package:curry_leaf/components/button.dart';
import 'package:curry_leaf/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(248, 39, 184, 50),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Shopping Cart'),
          backgroundColor: const Color.fromARGB(248, 39, 184, 50),
        ),
        body: Column(
          children: [
            Expanded(
              child: value.cart.isEmpty
                  ? Center(
                child: Text(
                  'Your cart is empty!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(248, 112, 209, 119),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01,
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                      subtitle: Text(
                        'Rs. $foodPrice',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: MyButton(
                text: 'Pay Now',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
