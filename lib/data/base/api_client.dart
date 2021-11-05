import 'package:dio/dio.dart';
import 'package:flutter_mvvm/data/base/base_dio.dart';
import 'package:flutter_mvvm/data/product/model/product.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com')
abstract class ApiClient {
  factory ApiClient({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/products")
  Future<List<Product>?> getProducts();
}