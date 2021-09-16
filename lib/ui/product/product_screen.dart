import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/product/model/product.dart';
import 'package:flutter_mvvm/di/service_locator.dart';
import 'package:flutter_mvvm/ui/product/product_viewmodel.dart';
import 'package:flutter_mvvm/ui/widgets/error_screen.dart';
import 'package:flutter_mvvm/ui/widgets/loading_screen.dart';
import 'package:flutter_mvvm/util/response.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductViewModel viewModel = serviceLocator.get<ProductViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<ProductViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<ProductViewModel>(builder: (context, viewModel, _) {
          Widget result;
          switch (viewModel.productsUseCase.state) {
            case ResponseState.LOADING:
              return LoadingScreen();
            case ResponseState.SUCCESS:
              if (viewModel.productsUseCase.data == null) {
                result = Container();
              } else {
                result = ListView(
                  children: viewModel.productsUseCase.data!.map((item) => ProductItem(
                    product: item,
                  )).toList(),
                );
              }
              break;
            case ResponseState.ERROR:
              return ErrorScreen(message: viewModel.productsUseCase.exception,);
          }

          return result;
        }),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product? _product;

  ProductItem({
    Key? key,
    Product? product
  }) : _product = product,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/product_detail", arguments: _product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0x191c1f4a),
              offset: Offset(0, 15),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_product?.title ?? "", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8.0),
              Text(
                _product?.description ?? "",
                style: TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
