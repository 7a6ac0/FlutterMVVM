import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/product/model/product.dart';
import 'package:flutter_mvvm/data/product/product_repository.dart';
import 'package:flutter_mvvm/di/service_locator.dart';
import 'package:flutter_mvvm/util/response.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _productRepository = serviceLocator<ProductRepository>();
  late Response<List<Product>> _productsUseCase;
  Response<List<Product>> get productsUseCase => _productsUseCase;

  void _setProductUseCase(Response response) {
    _productsUseCase = response as Response<List<Product>>;
    notifyListeners();
  }

  Future<void> getProducts() async {
    _setProductUseCase(Response.loading<List<Product>>());
    try {
      var response = await _productRepository.getProducts();
      _setProductUseCase(Response.success<List<Product>>(response ?? []));
    } catch (exception) {
      _setProductUseCase(Response.error<List<Product>>(exception.toString()));
    }
  }
}