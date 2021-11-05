import 'package:flutter_mvvm/data/base/api_client.dart';
import 'package:flutter_mvvm/data/product/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getProducts();
}

class DefaultProductRepository implements ProductRepository {
  @override
  Future<List<Product>?> getProducts() {
    return ApiClient().getProducts();
  }
}