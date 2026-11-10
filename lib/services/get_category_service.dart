import 'dart:convert';

import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/models/product_model.dart';

class GetCategoryService {
  GetCategoryService();

  Future<dynamic> getCategoriesProducts({required String categoryName}) async {
    
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productsBasedCategory = [];
      for (var item in data) {
        productsBasedCategory.add(ProductModel.fromJson(item));
      }
      return productsBasedCategory;
    
  }
}
