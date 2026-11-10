import 'package:e_commerce_app/Widgets/product_card.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/get_all_products_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Trend', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            List<ProductModel> products = asyncSnapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.15,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15, 
                ),
                itemBuilder: (_, index) => ProductCard(productModel: products[index]),
                itemCount: products.length,
              ),
            );
          } 
          else if (asyncSnapshot.hasError) {
            return Center(
              child: Text('Error: ${asyncSnapshot.error}'),
            );
          } 
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}