import 'dart:developer';

import 'package:e_commerce_app/Widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/Widgets/text_form_field_widget.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/update_product_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpateProductPage extends StatefulWidget {
  UpateProductPage({super.key});
  static String id = 'UpateProductPage';

  @override
  State<UpateProductPage> createState() => _UpateProductPageState();
}

class _UpateProductPageState extends State<UpateProductPage> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    if (args == null || args is! ProductModel) {
      return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(
            child: Text('Error: No Product Data was passed to this page!'),
          ),
        ),
      );
    }
    ProductModel currentProduct = args;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Update Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(currentProduct.image),
              ),
              TextFormFieldWidget(
                hint: 'Product name',
                initialValue: currentProduct.title,
                onChanged: (value) {
                  productName = value;
                },
              ),
              TextFormFieldWidget(
                hint: 'Product Price',
                initialValue: currentProduct.price.toString(),
                inputType: TextInputType.number,
                onChanged: (value) {
                  price = value;
                },
              ),
              TextFormFieldWidget(
                hint: 'Product Image',
                initialValue: currentProduct.image,
                onChanged: (value) {
                  image = value;
                },
              ),
              TextFormFieldWidget(
                hint: 'Product Description',
                initialValue: currentProduct.description,
                onChanged: (value) {
                  desc = value;
                },
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                text: 'Update',
                bgColor: Colors.deepPurpleAccent,
                textColor: Colors.black,
                onPressed: () async { 
                    setState(() {
                      isLoading = true;
                    });
                    
                    try {
                       await updateProductMethod(currentProduct); 
                      log('Success');
                    } catch (e) {
                      log(e.toString());
                    }
                    
                    setState(() {
                      isLoading = false;
                    });
                    
                    Navigator.pop(context, true); // بنرجع true للـ Home
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(ProductModel currentProduct) async{
    await UpdateProductService().updateProduct(
      id: currentProduct.id,
      title: productName ?? currentProduct.title,
      price: price ?? currentProduct.price.toString(),
      desc: desc ?? currentProduct.description,
      image: image ?? currentProduct.image,
      category: currentProduct.category,
    );
  }
}
