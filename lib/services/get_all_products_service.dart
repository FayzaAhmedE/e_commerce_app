import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = [];
    for (var item in data) {
      productsList.add(ProductModel.fromJson(item));
    }

    return productsList;
  }
}

