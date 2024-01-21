import 'package:emart_food_delivery_app/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExist,
      this.time,
      this.product
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quatity'];
    price = json['price'];
    isExist = json['isExist'];
    img = json['img'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }


  Map<String, dynamic> toJson(){
    return{
      "id" : this.id,
    "name" : this.name,
    "price" : this.price,
    "img" : this.img,
    "quantity" : this.quantity,
    "isExist" : this.isExist,
    "time" : this.time,
    "product" : this.product!.toJson(),
    };
  }
  
}