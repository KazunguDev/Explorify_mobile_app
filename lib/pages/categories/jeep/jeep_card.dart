import 'package:flutter/material.dart';

import 'package:xplorebts/models/product_model.dart';
import 'package:xplorebts/pages/product_page.dart';
import 'package:xplorebts/theme.dart';

class JeepCard extends StatelessWidget {
  final ProductModel product;

  JeepCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network(
              (product.galleries?[0].url) as String,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (product.category!.name) as String,
                    style: price.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    (product.name) as String,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${product.price}',
                    style: price.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
