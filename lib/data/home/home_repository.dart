import 'package:flutter_mvvm/data/base/api_client.dart';
import 'package:flutter_mvvm/data/home/model/product.dart';

abstract class HomeRepository {
  Future<List<Product>> getProducts();
}

class DefaultHomeRepository implements HomeRepository {
  @override
  Future<List<Product>> getProducts() {
    return ApiClient().getProducts();
  }
}