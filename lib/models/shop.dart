import 'package:flutter/cupertino.dart';
import 'food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu = [
    Food(
      name: 'Biriyani',
      price: '500.00',
      imagePath: 'assets/biryani.png',
      rating: '4.5',
      description:
      'A flavorful and aromatic rice dish cooked with a lot of spices and herbs blended with your choice of meat (chicken, mutton, fish) or vegetables. Commonly garnished with fried onions, boiled eggs, and nuts, biriyani has become a popular comfort food among South Asians.',
    ),
    Food(
      name: 'Curry',
      price: '50.00',
      imagePath: 'assets/curry.png',
      rating: '4.0',
      description:
      ' A versatile and richly spiced dish featuring a savory base of onion, garlic, and tomatoes. It is commonly prepared with meat, seafood, or vegetables and served alongside rice or bread. Each curry has a unique blend of spices, offering bold and warming flavors.',
    ),
    Food(
      name: 'Egg Rice',
      price: '450.00',
      imagePath: 'assets/egg-rice.png',
      rating: '3.5',
      description:
      'A simple, pleasing dish of stir-fried cooked rice with scrambled eggs, onions, and light spices. Most often enhanced with soy sauce, vegetables, or herbs, egg rice is a comfort food.',
    ),
    Food(
      name: 'Fried Rice',
      price: '600.00',
      imagePath: 'assets/fried-rice.png',
      rating: '4.5',
      description:
      'Stir-fried rice with mixed vegetables and, if desired, meat or seafood. It is flavored with soy sauce, garlic, and spring onions, making for a great and savory meal. Can be served as a main course or side.',
    ),
    Food(
      name: 'Noodles',
      price: '200.00',
      imagePath: 'assets/noodles.png',
      rating: '4.0',
      description:
      'Made from wheat, rice, or egg noodles, stir-fried or boiled and then tossed with vegetables, sauces, and optionally meat or seafood; this is a versatile meal. It is a family favorite in many Asian cuisines and offers endless options for customization.',
    ),
    Food(
      name: 'Rice & Curry',
      price: '250.00',
      imagePath: 'assets/rice-curry.png',
      rating: '3.5',
      description:
      'A simple, wholesome, traditional meal of steamed rice served with one or more curry dishes, which may be vegetable, lentil (dal), or meat-based, offering a balance of flavors and a good, filling meal.',
    ),
    Food(
      name: 'Roti',
      price: '25.00',
      imagePath: 'assets/roti.png',
      rating: '4.5',
      description:
      'A soft, unleavened bread made from finely milled whole wheat flour, usually cooked on a griddle. Roti is a staple in South Asian cuisine to scoop up curries or as a wrap for various fillings.',
    ),
  ];

  final List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i=0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }

}