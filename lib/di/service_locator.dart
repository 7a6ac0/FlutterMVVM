import 'package:flutter_mvvm/data/home/home_repository.dart';
import 'package:flutter_mvvm/ui/home/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void initServiceLocator() {
  // Repository
  serviceLocator.registerLazySingleton<HomeRepository>(() => DefaultHomeRepository());

  // ViewModel
  serviceLocator.registerFactory<HomeViewModel>(() => HomeViewModel());
}