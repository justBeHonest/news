import 'package:news/features/home/model/product_model.dart';
import 'package:news/product/padding/page_padding.dart';
import 'package:news/product/utility/image/project_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.model}) : super(key: key);
  final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: PagePadding.all(),
      child: Card(
        child: ListTile(
          contentPadding: PagePadding.all(),
          title: SizedBox(
              height: context.height() * 0.5,
              child: ProjectNetworkImage.network(src: model?.image)),
          subtitle: Text(
            model.toString(),
            style: context.textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
