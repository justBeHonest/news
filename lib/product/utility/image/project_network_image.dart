import 'package:news/product/constant/application_constant.dart';
import 'package:news/product/mixin/image_mixin.dart';
import 'package:flutter/material.dart';

class ProjectNetworkImage extends Image with ImageMixin {
  ProjectNetworkImage.network({Key? key, String? src})
      : super.network(
          src ?? ApplicationConstant.instane.dummyImage,
          key: key,
        );
}
