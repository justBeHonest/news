import 'package:news/features/home/model/product_model.dart';
import 'package:news/product/constant/application_constant.dart';
import 'package:vexana/vexana.dart';

class ProductNetworkManager extends NetworkManager<ProductModel> {
  ProductNetworkManager()
      : super(
            options: BaseOptions(
                baseUrl: ApplicationConstant.instane.productBaseUrl));
}
