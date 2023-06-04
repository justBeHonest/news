import 'package:news/product/utility/image/project_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({Key? key, this.url}) : super(key: key);
  final String? url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: ProjectNetworkImage.network(src: url),
    ).paddingAll(16);
  }
}
