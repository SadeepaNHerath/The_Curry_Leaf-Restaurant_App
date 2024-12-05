import 'package:curry_leaf/components/button.dart';
import 'package:curry_leaf/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/food_card.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetail(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('The Curry Leaf'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart-page');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(248, 39, 184, 50),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.04,
                horizontal: screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get 10% Discount',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: screenWidth * 0.05,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      MyButton(
                        text: 'Redeem',
                        onTap: () {},
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/noodles.png',
                    width: screenWidth * 0.2,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search here...',
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                "Food Menu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: screenWidth * 0.05,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            SizedBox(
              height: screenWidth * 0.8,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodCard(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetail(index),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenWidth * 0.03,
              ),
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/biryani.png',
                        height: screenWidth * 0.15,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Biriyani',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: screenWidth * 0.05,
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            'Rs. 500.00',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: screenWidth * 0.07,
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