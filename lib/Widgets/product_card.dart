import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/upate_product_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool? isUpdated = await Navigator.pushNamed(
          context,
          UpateProductPage.id,
          arguments: widget.productModel,
        ) as bool?;

        if (isUpdated == true && mounted) {
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              // height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 18,
                    color: Colors.black.withValues(alpha: 0.1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.productModel.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$ ${widget.productModel.price.toString()}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(flex: 1),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          icon: (isFav)
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: -35,
              right: 10,
              child: Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    widget.productModel.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
