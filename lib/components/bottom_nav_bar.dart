import 'package:curry_leaf/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool showLabels;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppTheme.largeRadius),
          topRight: Radius.circular(AppTheme.largeRadius),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppTheme.largeRadius),
          topRight: Radius.circular(AppTheme.largeRadius),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ),
          showSelectedLabels: showLabels,
          showUnselectedLabels: showLabels,
          elevation: 0,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home_outlined, 0),
              activeIcon: _buildActiveIcon(Icons.home_rounded, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.restaurant_menu_outlined, 1),
              activeIcon: _buildActiveIcon(Icons.restaurant_menu, 1),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.favorite_border_outlined, 2),
              activeIcon: _buildActiveIcon(Icons.favorite, 2),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.shopping_cart_outlined, 3),
              activeIcon: _buildActiveIcon(Icons.shopping_cart, 3),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Icon(icon),
    );
  }

  Widget _buildActiveIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }
}
