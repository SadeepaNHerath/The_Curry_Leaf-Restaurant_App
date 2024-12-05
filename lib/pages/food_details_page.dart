import 'package:curry_leaf/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {
    if (quantity > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantity);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(248, 112, 209, 119),
          title: const Text('Add to Cart'),
          content: Text(
            'Added $quantity ${widget.food.name} to cart',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
              color: Colors.white,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Screen size variables for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: screenHeight * 0.25,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800], size: screenWidth * 0.06),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: screenWidth * 0.07),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: screenWidth * 0.04,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(248, 39, 184, 50),
            padding: EdgeInsets.all(screenWidth * 0.06),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs. ${widget.food.price}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(248, 112, 209, 119),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(Icons.remove),
                            iconSize: screenWidth * 0.06,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.1,
                          child: Center(
                            child: Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(248, 112, 209, 119),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(Icons.add),
                            iconSize: screenWidth * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                MyButton(text: 'Add To Cart', onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
