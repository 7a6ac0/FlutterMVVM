import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/service_locator.dart';
import 'package:flutter_mvvm/ui/home/home_viewmodel.dart';
import 'package:flutter_mvvm/util/response.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = serviceLocator.get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<HomeViewModel>(builder: (context, viewModel, _) {
          switch (viewModel.productsUseCase.state) {
            case ResponseState.LOADING:
              print("LOADING");
              break;
            case ResponseState.SUCCESS:
              print("SUCCESS");
              break;
            case ResponseState.ERROR:
              print("ERROR");
              break;
          }
          return Container();
        }),
      ),
    );
  }
}
