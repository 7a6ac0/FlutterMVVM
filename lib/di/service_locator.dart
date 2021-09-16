import 'package:flutter_mvvm/data/product/product_repository.dart';
import 'package:flutter_mvvm/ui/product/product_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void initServiceLocator() {
  // Repository
  serviceLocator.registerLazySingleton<ProductRepository>(() => DefaultProductRepository());

  // ViewModel
  serviceLocator.registerFactory<ProductViewModel>(() => ProductViewModel());
}