import 'package:curry_leaf/models/food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodCard({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: screenWidth * 0.05),
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              food.imagePath,
              height: screenHeight * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: screenWidth * 0.05,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs.${food.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: screenWidth * 0.05,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        food.rating,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
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
