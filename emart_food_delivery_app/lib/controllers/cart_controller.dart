import 'package:emart_food_delivery_app/data/repository/cart_repo.dart';
import 'package:emart_food_delivery_app/models/cart_model.dart';
import 'package:emart_food_delivery_app/models/products_model.dart';
import 'package:emart_food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  // ignore: prefer_final_fields
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items=>_items;
  List<CartModel> storageItems=[];

  
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        if (value.quantity != null) {
          totalQuantity = value.quantity! + quantity;
        } else {
          totalQuantity = 0;
        }
        
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          quantity: (value.quantity ?? 0) + quantity,

          img: value.img,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          quantity: quantity,
          img: product.img,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      }else{
        Get.snackbar("Item count", "You should at least add an item in the cart !",
      backgroundColor: AppColors.mainColor,
      colorText: AppColors.whiteColor,
      );
      }
    }
    cartRepo.addToCartList(getItems);
    update();

  }


  bool existInCart(ProductModel product){
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id && value != null) {
        quantity = value.quantity ?? 0;
      }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      if (value != null) {
      totalQuantity += value.quantity ?? 0;
    }
     });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

int get totalAmount{
  var total=0;
  _items.forEach((key, value) {
    if (value.quantity != null) {
      
    total += value.quantity!*value.price!;
    } else {
      total = 0;
    }
  });

  return total;
}

List<CartModel> getCartData(){

  setCart = cartRepo.getCartList();

  return storageItems;
}


set setCart(List<CartModel> items){
  storageItems = items;
  // print("Length of cart items "+storageItems.length.toString());
  for (int i = 0; i < storageItems.length; i++) {
    _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
  }
}

void addToHistory(){
  cartRepo.addToCartHistoryList();
  clear();
}

void clear(){
  _items={};
  update();
}

List<CartModel> getCartHistoryList(){
  return cartRepo.getCartHistoryList();
}

set setItems(Map<int, CartModel> setItems){
  _items = {};
  _items = setItems;
}

void addToCartList(){
  cartRepo.addToCartList(getItems);
  update();
}

}
