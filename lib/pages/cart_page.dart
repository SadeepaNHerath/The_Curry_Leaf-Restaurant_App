import 'package:curry_leaf/components/button.dart';
import 'package:curry_leaf/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Shopping Cart',
            style: GoogleFonts.dmSerifDisplay(
              fontSize: screenWidth * 0.05,
            ),
          ),
          backgroundColor: const Color.fromARGB(248, 39, 184, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: value.cart.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: screenWidth * 0.2,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'Your cart is empty!',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/menu-page');
                            },
                            child: Text(
                              'Continue Shopping',
                              style: TextStyle(
                                color: const Color.fromARGB(248, 39, 184, 50),
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.cart.length,
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      itemBuilder: (context, index) {
                        final Food food = value.cart[index];
                        final String foodName = food.name;
                        final String foodPrice = food.price;
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: const Offset(0, 2),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: screenHeight * 0.01,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.01,
                            ),
                            leading: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(248, 112, 209, 119),
                              radius: screenWidth * 0.06,
                              child: Text(
                                foodName[0],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.05,
                                ),
                              ),
                            ),
                            title: Text(
                              foodName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                            subtitle: Text(
                              'Rs. $foodPrice',
                              style: TextStyle(
                                color: const Color.fromARGB(248, 39, 184, 50),
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () => removeFromCart(food, context),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red[300],
                                size: screenWidth * 0.06,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.06),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -3),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  value.cart.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rs. ${value.cart.map((item) => double.parse(item.price)).reduce((a, b) => a + b).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(248, 39, 184, 50),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(
                      height: value.cart.isNotEmpty ? screenHeight * 0.02 : 0),
                  MyButton(
                    text: value.cart.isNotEmpty
                        ? 'Proceed to Checkout'
                        : 'Start Shopping',
                    onTap: () {
                      if (value.cart.isEmpty) {
                        Navigator.pushNamed(context, '/menu-page');
                      } else {
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
