import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends INetworkModel<ProductModel> with EquatableMixin {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  @override
  ProductModel fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  String toString() {
    return 'title: $title\n\nprice: $price\n\ndescription: $description\n\ncategory: $category';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, price];
}

// class Products {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;

//   Products(
//       {this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image,
//       this.rating});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating =
//         json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['image'] = this.image;
//     if (this.rating != null) {
//       data['rating'] = this.rating!.toJson();
//     }
//     return data;
//   }
// }

@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  /// Connect the generated [_PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RatingToJson(this);

  // facts
}
