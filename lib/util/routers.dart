import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/product/model/product.dart';
import 'package:flutter_mvvm/ui/product/product_detail_screen.dart';
import 'package:flutter_mvvm/ui/product/product_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/product_detail':
        var product = settings.arguments as Product;
        return MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)); 
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}