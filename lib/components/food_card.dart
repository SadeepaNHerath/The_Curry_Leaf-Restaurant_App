import 'package:curry_leaf/models/food.dart';
import 'package:curry_leaf/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatefulWidget {
  final Food food;
  final void Function()? onTap;
  final bool isFeatured;

  const FoodCard({
    super.key,
    required this.food,
    required this.onTap,
    this.isFeatured = false,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final width = widget.isFeatured ? screenWidth * 0.7 : screenWidth * 0.6;
    final double cardHeight = screenHeight * 0.36;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: widget.onTap,
            child: MouseRegion(
              onEnter: (_) => _onHover(true),
              onExit: (_) => _onHover(false),
              child: Container(
                width: width,
                height: cardHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.largeRadius),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.2),
                            offset: const Offset(0, 8),
                            blurRadius: 16.0,
                            spreadRadius: 2.0,
                          ),
                        ]
                      : AppTheme.defaultShadow,
                ),
                margin: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: widget.isFeatured ? 0 : screenWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFoodImage(screenWidth, screenHeight),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(
                            10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.food.name,
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize:
                                          screenWidth * 0.042,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimaryColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                _buildRatingBadge(),
                              ],
                            ),
                            const SizedBox(height: 4),

                            Expanded(
                              child: Text(
                                widget.food.description.length > 50
                                    ? '${widget.food.description.substring(0, 50)}...'
                                    : widget.food.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 11,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rs. ${widget.food.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryColor,
                                    fontSize:
                                        screenWidth * 0.038,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: AppTheme.primaryColor,
                                      size: 22,
                                    ),
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppTheme.primaryColor
                                          .withOpacity(0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFoodImage(double screenWidth, double screenHeight) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Hero(
          tag: 'food_image_${widget.food.name}',
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppTheme.largeRadius),
              topRight: Radius.circular(AppTheme.largeRadius),
            ),
            child: Image.asset(
              widget.food.imagePath,
              height: screenHeight * 0.15,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.black38,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        if (widget.isFeatured)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.accentColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Featured',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 14,
          ),
          const SizedBox(width: 2),
          Text(
            widget.food.rating,
            style: TextStyle(
              color: Colors.amber.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
